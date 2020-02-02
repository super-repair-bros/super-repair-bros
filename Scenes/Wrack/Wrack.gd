extends KinematicBody2D

signal wrackplease
signal is_repaired

export var isplaced = true


# Consts
var width = 8;
var height = 4;
var tile_size = 24;

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
		randomize()
		
		var coords = generate_random_on_crossing()
		position.x = coords[0]
		position.y = coords[1]
		isplaced = true
	
func placewrack():
	isplaced = false
	
func generate_random_on_crossing():
	# Insted of trying all random coords,
	# we use the grid of width x height tiles
	var rand = randi() % (width * height);
	var posX = (rand % width);
	var posY = int(rand / width);
	
	posX = (posX * tile_size + tile_size / 3) + 4;
	posY = (posY * tile_size + tile_size / 3) + 4;
	return [posX, posY]
