extends TileMap

export var levelwidht = 8
export var levelheight = 4


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for lvlx in range(0, levelwidht):
		for lvly in range(0, levelheight):
			var percent = randi() % 99 + 1
			if percent <= 80:
				# 4 Standard tiles
				var randnum = randi() % 4 + 1
				print(str(randnum))
				if randnum == 1:
					set_cell(lvlx, lvly, 0)
				if randnum == 2:
					set_cell(lvlx, lvly, 1)
				if randnum == 3:
					set_cell(lvlx, lvly, 2)
				if randnum == 4:
					set_cell(lvlx, lvly, 5)
			else:
				# 2 Blocked tiles
				var randnum = randi() % 2 + 1
				print(str(randnum))
				if randnum == 1:
					set_cell(lvlx, lvly, 3)
				if randnum == 2:
					set_cell(lvlx, lvly, 4)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")

func _on_WrackSpawnTimer_timeout():
	pass
