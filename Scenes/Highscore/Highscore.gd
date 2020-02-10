extends Node2D

var custom_font = DynamicFont.new()

func _ready():
	$MarginContainer/VBoxContainer2/Exit.grab_focus()
	$HTTPRequest.request("https://tcv8.de/lb/5e37f0b3fe232612b8eac82f/json-desc")
	
	custom_font.font_data = load("res://Assets/Fonts/retro_computer_personal_use.ttf")


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8()).result
	var highscoretext = ""
	var num = 1
	var container = $"MarginContainer/VBoxContainer2/VBoxContainer/ScrollContainer/ScoreContainer"
	for entry in json.dreamlo.leaderboard.entry:
		var child = build_entry(entry, num)
		container.add_child(child)
		
		num += 1
		if num >= 100:
			break


func _on_Exit_pressed():
	get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")


func _on_Link_pressed():
	OS.shell_open('https://github.com/super-repair-bros/super-repair-bros/blob/master/README.md#playing-the-game')

func build_entry(entry, num):
	var container = HBoxContainer.new()
	
	var numLabel = create_score_label(str(num), true)
	container.add_child(numLabel)
	
	var nameLabel = create_score_label(entry.name)
	container.add_child(nameLabel)
	
	var dateLabel = create_score_label(entry.date)
	container.add_child(dateLabel)
	
	var scoreLabel = create_score_label(entry.score)
	container.add_child(scoreLabel)
	
	return container

func create_score_label(text, small = false):
	var label = Label.new()
	label.text = text
	label.set("custom_fonts/font", custom_font)
	
	if !small:
		label.size_flags_horizontal = 3
		label.align = Label.ALIGN_RIGHT
	
	return label
