extends KinematicBody2D

export (int) var speed = 200
export (bool) var is_repairing = false

var velocity = Vector2(speed, 0)
var next_velocity = Vector2(speed, 0)


func _ready():
	$AnimationPlayer.play("idle")
	$RepairBar.play("default")

func _input(event):
	if event.is_action_pressed('right') && velocity.x == 0:
		next_velocity = Vector2(speed, 0)
	if event.is_action_pressed('left') && velocity.x == 0:
		next_velocity = Vector2(-speed, 0)
	if event.is_action_pressed('down') && velocity.y == 0:
		next_velocity = Vector2(0, speed)
	if event.is_action_pressed('up') && velocity.y == 0:
		next_velocity = Vector2(0, -speed)

func change_direction():
	var snappedPosition = position.snapped(Vector2(12, 12))
	var testTransform = Transform2D(0, snappedPosition)
	if velocity != next_velocity && !test_move(testTransform, next_velocity):
		position = snappedPosition
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
		change_direction()
		velocity = move_and_slide(velocity)
		world_is_endless()
