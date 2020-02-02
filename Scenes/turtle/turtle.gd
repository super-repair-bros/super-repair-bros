extends Area2D

signal turtle_smashed

var myturtlelocations = []
var lastloc = []

func _ready():
	$FlipAnimation.play("walking")
	$WalkingAnimation.play("walking")

func _on_tiles_placeturtle(turtlelocations):
	myturtlelocations = turtlelocations
	place_turtle()
	visible = true	


func place_turtle():
	randomize()
	var newpos = myturtlelocations[randi() % myturtlelocations.size()]
	if myturtlelocations.size() > 1 or not lastloc:
		# First time, or more than one locations, go on...
		while lastloc and (newpos[0] == lastloc[0] and newpos[1] == lastloc[1]):
			newpos = myturtlelocations[randi() % myturtlelocations.size()]
		lastloc = newpos
		position.x = newpos[0]
		position.y = newpos[1]
		visible = true
	else:
		position.x = -50
		position.y = -50


func _on_turtle_body_entered(body):
	if body.name == "MyCar":
		$turtlesmash.play()
		emit_signal("turtle_smashed")
		place_turtle()
