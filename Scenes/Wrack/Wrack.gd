extends Node2D

signal wrackplease

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal('wrackplease')
	
func place_a_wrack():
	randomize()
	var placed = false
	while not placed:
		position.x = randi() % int(get_viewport_rect().size.x) + 1
		position.y = randi() % int(get_viewport_rect().size.y) + 1
		# Check for collision
		placed = true
