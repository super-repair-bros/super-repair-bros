extends Node2D

func _on_Wrack_is_repaired():
	#$MyCar.move_and_slide(Vector2())
	#$MyCar/AnimationPlayer.play("repair")
	#$MyCar/RepairTimer.start()
	pass


func _on_GUI_GameOver():
	$"GameOver".show();
	get_tree().paused = true
