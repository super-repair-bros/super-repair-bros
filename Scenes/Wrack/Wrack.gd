extends KinematicBody2D

signal wrackplease
signal is_repaired

export var WRACKWIDTH = 8
export var WRACKHEIGHT = 8

var isplaced = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("broken")
	emit_signal('wrackplease')
	
func _physics_process(delta):
	if not isplaced:
		var posx
		var posy
		var from
		randomize()
		posx = randi() % int(get_viewport_rect().size.x) + 1
		posy = randi() % int(get_viewport_rect().size.y) + 1
		from = Transform2D(0, Vector2(posx, posy))
		while (
			test_move(from, Vector2(0, 1))
			or test_move(from, Vector2(0, -1))
			or test_move(from, Vector2(1, 0))
			or test_move(from, Vector2(-1, 0))
		):
			randomize()
			posx = randi() % int(get_viewport_rect().size.x) + 1
			posy = randi() % int(get_viewport_rect().size.y) + 1
			from = Transform2D(0, Vector2(posx, posy))
		position.x = posx
		position.y = posy
		isplaced = true
	
func place_a_wrack():
	isplaced = false
