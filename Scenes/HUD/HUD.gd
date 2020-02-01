extends Node

signal GameOver;

export var timeInSec = 20;
export var scorePerRepair = 10;

var score = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	refreshTime()
	refreshScore()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	timeInSec = timeInSec - 1;
	
	if timeInSec <= 0:
		emit_signal("GameOver")
		$"HBoxContainer/Timer".stop()
	
	refreshTime()

func refreshTime():
	$"HBoxContainer/time".text = "Time left: %s" % timeInSec;

func refreshScore():
	$"HBoxContainer/score".text = "Score: %s" % score;


func _on_level_successfully_repaired():
	score = score + scorePerRepair
	refreshScore()
