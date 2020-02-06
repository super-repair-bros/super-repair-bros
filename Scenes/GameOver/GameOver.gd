extends VBoxContainer

export var timeout = 10;

var is_game_over = false

func _ready():
	refresh();
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")

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
	var highscore_time = OS.get_datetime()
	var hour = (highscore_time["hour"] + 12) % 24
	var highscore_date = [
		highscore_time["day"],
		highscore_time["month"],
		highscore_time["year"],
		hour,
		highscore_time["minute"],
		highscore_time["second"]
	]
	
	var parsed = "%02d.%02d.%s %02d:%02d:%02d" % highscore_date
	
	var secretkey = 'OURSECRETKEYHERE'
	var url = "http://dreamlo.com/lb/" + secretkey + "/add/" + $"HBoxContainer/HighscoreName".text + "/" + str($"../HUD".score)
	var error = $HTTPRequest.request(url)
	if error != OK:
		push_error("An error occurred in the HTTP request, result was " + str(error))
		


func _on_request_completed(result, response_code, headers, body):
	go_to_title()


func _on_HighscoreName_focus_entered():
	$"Timer".stop();
