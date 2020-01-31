extends TileMap

export var levelwidht = 64
export var levelheight = 64

# Called when the node enters the scene tree for the first time.
func _ready():
	for lvlx in range(0, levelwidht):
		for lvly in range(0, levelheight):
			set_cell(lvlx, lvly, 0);
