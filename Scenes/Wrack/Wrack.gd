extends Node2D

signal wrackplease
signal is_repaired

export var WRACKWIDTH = 8
export var WRACKHEIGHT = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("broken")
	emit_signal('wrackplease')
	
func place_a_wrack():
	randomize()
	var spaceState = get_world_2d().direct_space_state
	var placed = false
	while not placed:
		var posx = randi() % int(get_viewport_rect().size.x) + 1
		var posy = randi() % int(get_viewport_rect().size.y) + 1
		var upperright = Vector2(posx+WRACKWIDTH/2, posy-WRACKHEIGHT/2)
		var upperleft = Vector2(posx-WRACKWIDTH/2, posy-WRACKHEIGHT/2)
		var lowerright = Vector2(posx+WRACKWIDTH/2, posy+WRACKHEIGHT/2)
		var lowerleft = Vector2(posx-WRACKWIDTH/2, posy+WRACKHEIGHT/2)
		
		position.x = posx
		position.y = posy
		# Check for collision
<<<<<<< HEAD
		placed = true


func _on_Area2D_body_entered(body):
	emit_signal("is_repaired")
=======
		var query = Physics2DShapeQueryParameters.new()

		if spaceState.intersect_point(upperright) and spaceState.intersect_point(upperleft) and spaceState.intersect_point(lowerright) and spaceState.intersect_point(lowerleft):
			print("upperright: " + str(upperright))
			print("upperleft: " + str(upperleft))
			print("lowerright: " + str(lowerright))
			print("lowerleft: " + str(lowerleft))			
			print("upperright: " + str(spaceState.intersect_point(upperright)))
			print("upperleft: " + str(spaceState.intersect_point(upperleft)))
			print("lowerright: " + str(spaceState.intersect_point(lowerright)))
			print("lowerleft: " + str(spaceState.intersect_point(lowerleft)))			
			placed = true
>>>>>>> caacec9ab420d05c4e534b8994a4ec346b82687c
