extends TileMap

export var levelwidht = 8
export var levelheight = 4

const NUMTILES = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for lvlx in range(0, levelwidht):
		for lvly in range(0, levelheight):
			var percent = randi() % 99 + 1
			if percent <= 80:
				# Standard tile
				set_cell(lvlx, lvly, 0);
			else:
				# Special tile
				set_cell(lvlx, lvly, randi() % (NUMTILES-1) + 1);

# I don't know why it does not work...
#func _input(_event):
#	if Input.is_action_pressed("KEY_ESCAPE"):
#		get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")

func _on_WrackSpawnTimer_timeout():
	pass
