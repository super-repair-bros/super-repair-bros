extends Node2D

signal successfully_repaired

var time_begin
var time_delay

export var turtleMurder = false

func _ready():
	time_begin = OS.get_ticks_usec()
	time_delay = AudioServer.get_time_to_next_mix() + AudioServer.get_output_latency()
	$BackgroundMusic.play()
	

func _process(delta):
	# Obtain from ticks.
	var time = (OS.get_ticks_usec() - time_begin) / 1000000.0
	# Compensate for latency.
	time -= time_delay
	# May be below 0 (did not being yet).
	time = max(0, time)

func _on_Wrack_is_repaired():
	$MyCar.move_and_slide(Vector2())
	$MyCar/CollisionShape2D.set_deferred("disabled", true)
	$MyCar.set_deferred("is_repairing", true)
	$MyCar/AnimationPlayer.play("repair")
	$MyCar/AnimatedSprite.play("repair")
	$MyCar/AnimationPlayer.play("repair_bar")
	$MyCar/RepairBar.play("repair_bar")
	$Wrack/AudioFixed.play()

	$MyCar/RepairTimer.start()


func _on_RepairTimer_timeout():
	emit_signal("successfully_repaired")
	$MyCar/CollisionShape2D.set_deferred("disabled", false)
	$MyCar.set_deferred("is_repairing", false)
	$MyCar/AnimationPlayer.play("idle")
	$MyCar/AnimatedSprite.play("idle")
	$MyCar/RepairBar.play("default")
	$Wrack.set_deferred("isplaced", false)

func _on_GUI_GameOver():
	$"GameOver".show();
	get_tree().paused = true
