extends Control


func _ready():
	$MainMenu/HBoxContainer/VBoxContainer/VBoxContainer/NewGameLabel.grab_focus()


func _process(_delta):
	
	if $MainMenu/HBoxContainer/VBoxContainer/VBoxContainer/NewGameLabel.is_hovered() == true:
		$MainMenu/HBoxContainer/VBoxContainer/VBoxContainer/NewGameLabel.grab_focus()
		
	if $MainMenu/HBoxContainer/VBoxContainer/VBoxContainer/CreditsLabel.is_hovered() == true:
		$MainMenu/HBoxContainer/VBoxContainer/VBoxContainer/CreditsLabel.grab_focus()



func _on_NewGameLabel_pressed():
	get_tree().change_scene("res://Scenes/level/level.tscn")


func _on_CreditsLabel_pressed():
	get_tree().change_scene("res://Scenes/Credits/Credits.tscn")


func _on_ExitLabel_pressed():
	pass # Replace with function body.
