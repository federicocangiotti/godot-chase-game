extends Window


var Radio: Dictionary = {"PopStar Radio" : "",
						"Metal Mayhem Radio" : "",
						"Rock Revolution Radio" : "",
						"Hip-Hop Heat Radio" : "",
						"EDM ElectroDrive Radio" : "",
						"Country Crossroads Radio" : "",
						"Classical Cruisers Radio" : "",
						"Punk Pulse Radio" : "",
						"Samurai Soul Radio" : "",
						"Mystical East Radio" : "",
						}

func AddRadio():
	var index = 0
	for i in Radio:
		$GridContainer/VBoxContainer/RadioSelectButton.add_item(i,index)
	index += 1
	pass

func _setRadioLogo():
	if($"RadioSelectButton".item_selected == "PopStar Radio"):
		$"RadioLogo".texture = load("res://Textures/UI_Images/Logo Radio/Pop.jpg")
	elif($"RadioSelectButton".item_selected == "Metal Mayhem Radio"):
		$"RadioLogo".texture = load("res://Textures/UI_Images/Logo Radio/Metal.jpg")
	elif($"RadioSelectButton".item_selected == "Rock Revolution Radio"):
		$"RadioLogo".texture = load("res://Textures/UI_Images/Logo Radio/Rock.jpg")
	elif($"RadioSelectButton".item_selected == "Hip-Hop Heat Radio"):
		$"RadioLogo".texture = load("res://Textures/UI_Images/Logo Radio/Hip-Hop.jpg")
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AddRadio()
	_setRadioLogo()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
