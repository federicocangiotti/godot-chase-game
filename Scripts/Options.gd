extends Control

@onready var ResOptionButton = $VBoxContainer/MarginContainer/GridContainer/OptionsContainer/OptionsVContainer/ResolutionHContainer/ResolutionButton
@onready var MusicButton = $VBoxContainer/MarginContainer/GridContainer/OptionsContainer/OptionsVContainer/MusicHContainer/MusicButton
@onready var FullScreenCheckBox = $VBoxContainer/MarginContainer/GridContainer/OptionsContainer/OptionsVContainer/FullScreenHContainer/FullScreenCheckBox

var CurrentMusic = ""

var FullScreenCheckBoxPressed

var Resolutions: Dictionary = {"1920x1080":Vector2i(1920,1080),
	"1600x900":Vector2i(1600,900),
	"1536x864":Vector2i(1536,864),
	"1440x900":Vector2i(1440,900),
	"1366x768":Vector2i(1366,768),}

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	pass # Replace with function body.

# Called when the node enters the scene tree for the first time.
func _ready():
	IsFullScreen()
	AddResolutions()
	AddMusic()
	pass # Replace with function body.

func IsFullScreen():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		FullScreenCheckBox.button_pressed = true
	else:
		FullScreenCheckBox.button_pressed = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func AddMusic():
	var index = 0
	
	for i in MusicController.Musics:
		MusicButton.add_item(i,index)
		
		if MusicController.Musics[i] == CurrentMusic:
			MusicButton._select_int(index)
	index += 1
	pass
	
func AddResolutions():
	var CurrentRes = get_viewport().get_size()
	
	var index = 0
	
	for r in Resolutions:
		ResOptionButton.add_item(r,index)
		
		if Resolutions[r] == CurrentRes:
			ResOptionButton._select_int(index)
		index += 1

func _on_resolution_button_item_selected(index):
	var size = Resolutions.get(ResOptionButton.get_item_text(index))
	DisplayServer.window_set_size(size)
	get_window().size = size
	pass # Replace with function body.


func _on_music_button_item_selected(index):
	var chosenMusic = MusicButton.get_item_text(index)
	await MusicController.playMusic(chosenMusic)
	pass # Replace with function body.


func _on_full_screen_check_box_toggled(button_pressed: bool) -> void:
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		ResOptionButton.visible = false
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		ResOptionButton.visible = true
	pass # Replace with function body.
