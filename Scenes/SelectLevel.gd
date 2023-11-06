extends Control

# Change level
# set level to cita1
func _on_citta_1_pressed():
	Global.selected_level = "res://Scenes/Playground.tscn"
	$CitySelected.texture = load("res://Textures/UI_Images/Others/City1.png")

# set level to cita2
func _on_citta_2_pressed():
	Global.selected_level = "res://Scenes/Playground2.tscn"
	$CitySelected.texture = load("res://Textures/UI_Images/Others/City2.png")
	pass


# Change player sprite
# set sportiva sprite
func _on_sportiva_pressed():
	Global.selected_player.sprite = "res://Textures/Cars/car1.png"
	Global.selected_player.braking = -600
	Global.selected_player.engine_power = 550
	Global.selected_player.max_speed_reverse = 300
	$CarSelected.texture = load("res://Textures/Cars/car1.png")

# set fuoristrada sprite
func _on_fuoristrada_pressed():
	Global.selected_player.sprite = "res://Textures/Cars/car2.png"
	Global.selected_player.braking = -400
	Global.selected_player.engine_power = 400
	Global.selected_player.max_speed_reverse = 150
	$CarSelected.texture = load("res://Textures/Cars/car2.png")


func _on_gioca_pressed():
	get_tree().change_scene_to_file(Global.selected_level)

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
