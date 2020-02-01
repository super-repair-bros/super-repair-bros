extends TileMap

export var levelwidht = 8
export var levelheight = 4

const NUMTILES = 3

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
