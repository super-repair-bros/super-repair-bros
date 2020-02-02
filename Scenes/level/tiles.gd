extends TileMap

export var levelwidht = 8
export var levelheight = 4

var turtlelocations = []
var tile_size = 24;

signal placeturtle

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	# First draw the border
	for lvlx in range(0, levelwidht):
		var tilenum = get_random_nonblockedtile()
		if tilenum == 3:
			# This tile has a crosswalk, remember that for our turtle locations
			turtlelocations.append(Vector2(lvlx * tile_size + 5, 0 * tile_size + 11))
		set_cell(lvlx, 0, tilenum)
		tilenum = get_random_nonblockedtile()
		if tilenum == 3:
			# This tile has a crosswalk, remember that for our turtle locations
			turtlelocations.append(Vector2(lvlx * tile_size + 5, (levelheight - 1) * tile_size + 11))		
		set_cell(lvlx, levelheight - 1, tilenum)
	
	for lvly in range(1, levelheight - 1):
		var tilenum = get_random_nonblockedtile()
		if tilenum == 3:
			# This tile has a crosswalk, remember that for our turtle locations
			turtlelocations.append(Vector2(0 * tile_size + 5, lvly * tile_size + 11))
		set_cell(0, lvly, tilenum)
		tilenum = get_random_nonblockedtile()
		if tilenum == 3:
			# This tile has a crosswalk, remember that for our turtle locations
			turtlelocations.append(Vector2((levelwidht - 1) * tile_size + 5, lvly * tile_size + 11))
		set_cell(levelwidht - 1, lvly, tilenum)
	
	for lvlx in range(1, levelwidht - 1):
		for lvly in range(1, levelheight - 1):
			var percent = randi() % 99 + 1
			if percent <= 80:
				# 4 Standard tiles
				var tilenum = get_random_nonblockedtile()
				if tilenum == 3:
					# This tile has a crosswalk, remember that for our turtle locations
					turtlelocations.append(Vector2(lvlx * tile_size + 5, lvly * tile_size + 11))
				set_cell(lvlx, lvly, tilenum)
			else:
				# 3 Blocked tiles
				var randnum = randi() % 3 + 1
				if randnum == 1:
					set_cell(lvlx, lvly, 2)
				if randnum == 2:
					set_cell(lvlx, lvly, 5)
				if randnum == 3:
					set_cell(lvlx, lvly, 6)
	# Set a turtle
	if turtlelocations:
		emit_signal("placeturtle", turtlelocations)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")
		
func get_random_nonblockedtile():
	var rand = randi() % 5;
	while rand == 2: 
		rand = randi() % 5
	return rand
