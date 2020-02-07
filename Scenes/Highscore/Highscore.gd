extends Node2D


func _ready():
    $MarginContainer/VBoxContainer2/Exit.grab_focus()
    $HTTPRequest.request("https://tcv8.de/lb/5e37f0b3fe232612b8eac82f/json-desc")


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
    var json = JSON.parse(body.get_string_from_utf8()).result
    var highscoretext = ""
    var num = 1
    for entry in json.dreamlo.leaderboard.entry:
        highscoretext += "%3s: %40s %50s %20s\n" % [num, entry.name, entry.date, entry.score]
        num += 1
        if num >= 100:
            break
    $"MarginContainer/VBoxContainer2/VBoxContainer/HighscoreText".text = highscoretext


func _on_Exit_pressed():
    get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")


func _on_Link_pressed():
    OS.shell_open('https://github.com/super-repair-bros/super-repair-bros/blob/master/README.md#playing-the-game')
