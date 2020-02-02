extends KinematicBody2D

func _ready():
	position.x = -50
	position.y = -50


func _on_tiles_placeturtle(pos):
	print("Place Turtle at: " + str(pos[0]) + ", " + str(pos[1]))
	position.x = pos[0]
	position.y = pos[1]
