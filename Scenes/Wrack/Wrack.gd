extends KinematicBody2D

signal wrackplease
signal is_repaired

export var isplaced = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("broken")
	$AudioStreamPlayer2D.play()
	emit_signal('wrackplease')

func _on_Area2D_body_entered(body):
	if (body.get_name() == "MyCar"):
		emit_signal("is_repaired")

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
	
func placewrack():
	isplaced = false
