extends Area2D

var myturtlelocations = []

func _on_tiles_placeturtle(turtlelocations):
	myturtlelocations = turtlelocations
	place_turtle()
	visible = true	


func place_turtle():
	var newpos = myturtlelocations[randi() % myturtlelocations.size()]
	position.x = newpos[0]
	position.y = newpos[1]
	visible = true	


func _on_turtle_body_entered(body):
	if body.name == "MyCar":
		emit_signal("turtlesmashed")
		place_turtle()
