extends TileMap

export var levelwidht = 8
export var levelheight = 4

var turtlelocations = []
var tile_size = 24;

signal placeturtle

# Called when the node enters the scene tree for the first time.
func _ready():
	# First draw the border
	for lvlx in range(0, levelwidht):
		set_cell(lvlx, 0, 0)
		set_cell(lvlx, levelheight - 1, 0)
	
	for lvly in range(1, levelheight - 1):
		set_cell(0, lvly, 0)
		set_cell(levelwidht - 1, lvly, 0)
	
	randomize()
	for lvlx in range(1, levelwidht - 1):
		for lvly in range(1, levelheight - 1):
			var percent = randi() % 99 + 1
			if percent <= 80:
				# 4 Standard tiles
				var randnum = randi() % 4 + 1
				if randnum == 1:
					set_cell(lvlx, lvly, 0)
				if randnum == 2:
					set_cell(lvlx, lvly, 1)
				if randnum == 3:
					# This tile has a crosswalk, remember that for our turtle locations
					turtlelocations.append(Vector2(lvlx * tile_size, lvly * tile_size))					
					set_cell(lvlx, lvly, 3)
				if randnum == 4:
					set_cell(lvlx, lvly, 4)
			else:
				# 2 Blocked tiles
				var randnum = randi() % 2 + 1
				if randnum == 1:
					set_cell(lvlx, lvly, 2)
				if randnum == 2:
					set_cell(lvlx, lvly, 5)
	# Set a turtle
	if turtlelocations:
		emit_signal("placeturtle", turtlelocations[0])
		emit_signal("showturtle")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")

func _on_WrackSpawnTimer_timeout():
	pass
