extends KinematicBody2D

export (int) var speed = 200
export (bool) var is_repairing = false

var velocity = Vector2(speed, 0)
var next_velocity = Vector2(speed, 0)


func _ready():
	$AnimationPlayer.play("idle")

func get_input():
	if Input.is_action_pressed('right') && velocity.x >= 0:
		next_velocity = Vector2(speed, 0)
	if Input.is_action_pressed('left') && velocity.x <= 0:
		next_velocity = Vector2(-speed, 0)
	if Input.is_action_pressed('down') && velocity.y >= 0:
		next_velocity = Vector2(0, speed)
	if Input.is_action_pressed('up') && velocity.y <= 0:
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
	if is_repairing == true:
		pass
	else:
		get_input()
		velocity = move_and_slide (velocity, Vector2( 0, 0 ), false, 1)
	    change_direction()
	    world_is_endless()
