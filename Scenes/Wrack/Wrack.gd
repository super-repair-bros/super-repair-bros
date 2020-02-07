extends KinematicBody2D

signal is_repaired

export var isplaced = true


# Consts
var width = 8;
var height = 4;
var tile_size = 24;

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("broken")
	place_wrack()

func _on_Area2D_body_entered(body):
	if (body.get_name() == "MyCar"):
		emit_signal("is_repaired")

func _physics_process(delta):
	if not isplaced:
		randomize()
		
		var coords = generate_random_on_crossing()
		position.x = coords[0]
		position.y = coords[1]
		isplaced = true
		$AudioStreamPlayer2D.play()
	
func place_wrack():
	isplaced = false
	
func generate_random_on_crossing():
	var rand = randi() % (width * height);
	var posX = (rand % width);
	var posY = int(rand / width);
	
	posX = (posX * tile_size + tile_size / 3) + 4;
	posY = (posY * tile_size + tile_size / 3) + 4;
	return [posX, posY]
