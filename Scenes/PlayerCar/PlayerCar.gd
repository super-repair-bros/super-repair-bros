extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func _ready():
	$AnimationPlayer.play("idle")

func get_input():
	if Input.is_action_pressed('right'):
		velocity = Vector2()
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity = Vector2()
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity = Vector2()
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity = Vector2()
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
	if position.x > get_viewport_rect().size.x:
		position.x = 0
	if position.y > get_viewport_rect().size.y:
		position.y = 0
	if position.x < 0:
		position.x = get_viewport_rect().size.x
	if position.y < 0:
		position.y = get_viewport_rect().size.y


func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
