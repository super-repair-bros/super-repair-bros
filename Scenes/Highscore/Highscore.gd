extends Node2D


func _ready():
	$MarginContainer/VBoxContainer2/Exit.grab_focus()
	$HTTPRequest.request("http://dreamlo.com/lb/5e37f0b3fe232612b8eac82f/json-desc")


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8()).result
	var highscoretext = ""
	var num = 1
	for entry in json.dreamlo.leaderboard.entry:

		var date = entry.date
		var splitup = date.split(" ", false, 0)
		if splitup.size() > 3:
			print("Error: splitup too big")
			break

		var dateParts = splitup[0].split("/", false, 0)
		if dateParts.size() > 3:
			print("Error: dateParts too big")
			break

		var timeParts = splitup[1].split(":", false, 0)
		if timeParts.size() > 3:
			print("Error: timeParts too big")
			break

		var isPm = splitup[2] == "PM"
		
		var hour = int(timeParts[0])
		if isPm:
			hour = (hour + 12) % 24
		
		var paramsInOrder = [
			int(dateParts[1]),
			int(dateParts[0]),
			dateParts[2],
			hour,
			int(timeParts[1]),
			int(timeParts[2])
		];
		var parsed = "%02d.%02d.%s %02d:%02d:%02d" % paramsInOrder

		highscoretext += "%3s: %40s %50s %20s\n" % [num, entry.name, parsed, entry.score]
		num += 1
		if num >= 100:
			break
	$"MarginContainer/VBoxContainer2/VBoxContainer/HighscoreText".text = highscoretext


func _on_Exit_pressed():
	get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")


func _on_Link_pressed():
	OS.shell_open('https://github.com/super-repair-bros/super-repair-bros/blob/master/README.md#playing-the-game')
