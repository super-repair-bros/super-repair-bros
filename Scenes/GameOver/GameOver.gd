extends VBoxContainer

export var timeout = 10;
export var min_timeout_input = 8;

func _ready():
	refresh();

func _input(ev):
	if timeout <= min_timeout_input:
		go_to_title()

func show():
	visible = true;
	$"Timer".start();

func _on_Timer_timeout():
	timeout = timeout - 1;
	refresh();
	
	if timeout <= 0:
		go_to_title()

func refresh():
	$"GameOver".text = "Game over (%s)" % timeout
	if get_parent().turtleMurder:
		$"TurtleMurder".text = "turtle murder"
	
func go_to_title():
	var tree = get_tree()
	tree.change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")
	tree.paused = false
