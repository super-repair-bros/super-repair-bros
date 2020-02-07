extends VBoxContainer

export var timeout = 10;
#export var min_timeout_input = 8;
var is_game_over = false

func _ready():
    refresh();

func _input(event):
    if is_game_over:
        if event.is_action_pressed("ui_cancel") \
        or event.is_action_pressed("ui_accept"):
            go_to_title()
        
    if event.is_action_pressed("ui_cancel"):
        go_to_title()

func show():
    visible = true;
    $"Timer".start();
    if get_parent().turtleMurder:
        get_node("TurtleMurder").set_visible(true)

func _on_Timer_timeout():
    is_game_over = true
    timeout = timeout - 1;
    refresh();
    
    if timeout <= 0:
        is_game_over = false
        go_to_title()

func refresh():
    $"GameOver".text = "Game over (%s)" % timeout
    
func go_to_title():
    var tree = get_tree()
    tree.change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")
    tree.paused = false


func _on_HighscoreBtn_pressed():
    var secretkey = OURSECRETKEYHERE
    var url = "https://tcv8.de/lb/" + secretkey + "/add/" + $"HBoxContainer/HighscoreName".text + "/" + str($"../HUD".score)
    $HTTPRequest.request(url)
    go_to_title()
