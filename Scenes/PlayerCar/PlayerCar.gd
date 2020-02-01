extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2(speed, 0)
var next_velocity = Vector2(speed, 0)

func _ready():
	$AnimationPlayer.play("idle")

func _input(event):
	if (event is InputEventKey and event.pressed):
		var key = event.as_text()
		if 'Right' == key && velocity.x >= 0:
			next_velocity = Vector2(speed, 0)
		if 'Left' == key && velocity.x <= 0:
			next_velocity = Vector2(-speed, 0)
		if 'Down' == key && velocity.y >= 0:
			next_velocity = Vector2(0, speed)
		if 'Up' == key && velocity.y <= 0:
			next_velocity = Vector2(0, -speed)

func change_direction():
	if ! test_move(transform, next_velocity) && next_velocity != velocity:
		print("collision detected")
		velocity = next_velocity

func world_is_endless():
	if position.x > get_viewport_rect().size.x:
		position.x = 0
	if position.y > get_viewport_rect().size.y:
		position.y = 0
	if position.x < 0:
		position.x = get_viewport_rect().size.x
	if position.y < 0:
		position.y = get_viewport_rect().size.y


func _physics_process(_delta):

	velocity = move_and_slide (velocity, Vector2( 0, 0 ), false, 1)
	change_direction()
	world_is_endless()
