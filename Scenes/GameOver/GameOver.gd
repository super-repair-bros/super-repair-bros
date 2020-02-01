extends VBoxContainer

export var timeout = 10;

func _ready():
	refresh();

func show():
	visible = true;
	$"Timer".start();

func _on_Timer_timeout():
	timeout = timeout - 1;
	refresh();
	
	if timeout <= 0:
		get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")

func refresh():
	$"GameOver".text = "Game over (%s)" % timeout
