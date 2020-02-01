extends Node2D

signal wrackplease
signal is_repaired

export var WRACKWIDTH = 8
export var WRACKHEIGHT = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("broken")
	emit_signal('wrackplease')
	
func try_to_place_a_wrack():
	randomize()
	var posx = randi() % int(get_viewport_rect().size.x)
	var posy = randi() % int(get_viewport_rect().size.y)
	position.x = posx
	position.y = posy
	print("Ich bin hier")

func _on_Area2D_body_entered(body):
	if (body.get_name() == "MyCar"):
		emit_signal("is_repaired")
#	elif (body.get_name() == "tiles"):
#		print(body.get_name())
#		
#		try_to_place_a_wrack()
#	else:
#		print("Alles ok")
