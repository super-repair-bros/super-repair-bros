extends Node

signal GameOver

export var timeInSec = 20
export var scorePerRepair = 10
export var scorePerTurtle = 3

var carRepaired = false
export var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
    refreshTime()
    refreshScore()


func _on_Timer_timeout():
    timeInSec = timeInSec - 1;
    
    if timeInSec <= 0:
        emit_signal("GameOver")
        $"HBoxContainer/Timer".stop()
    
    refreshTime()


func refreshTime():
    $"HBoxContainer/time".text = "Time left: %s" % timeInSec


func refreshScore():
    $"HBoxContainer/score".text = "Score: %s" % score


func _on_level_successfully_repaired():
    score = score + scorePerRepair
    carRepaired = true
    get_parent().turtleMurder = false
    refreshScore()


func _on_turtle_turtle_smashed():
    score = score + scorePerTurtle
    if score >= 9 && !carRepaired:
        get_parent().turtleMurder = true
    else:
        get_parent().turtleMurder = false
    refreshScore()
