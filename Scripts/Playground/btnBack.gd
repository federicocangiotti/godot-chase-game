extends Button

var pause = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
# popup button
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	
#func _unhandled_input(event):
#	if event is InputEventKey:
#		if event.pressed and event.keycode == KEY_ESCAPE:
#			if not pause:
#				pause = true
#				set_physics_process(false)
#				$Options.show()
#			else:
#				pause = false
#				set_physics_process(true)
#				$Options.hide()
