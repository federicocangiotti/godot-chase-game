extends Node

var Musics: Dictionary = {"Seleziona musica/musica spenta":(""),
							"Super Mario":("res://Assets/Music/Athletic_Ballin_-_New_Super_Mario_Bros._Wii.mp3"),
							"Pokemon":("res://Assets/Music/Pokémon Center (Night)[Pokémon- Diamond & Pearl].mp3"),
							"Il_Vulcano":("res://Assets/Music/Domenico Bini - Il Vulcano.mp3"),
							"Jump up super star": ("res://Assets/Music/Super Mario Odyssey - Jump Up, Super Star!.mp3"),
							"jojo-Bloody Stream": ("res://Assets/Music/Jojo's Bizarre Adventure OP 2  UHD 2160p  Creditless.mp3"),
							"Merry Go Round of Life" : ("res://Assets/Music/Merry Go Round of Life - Howl's Moving Castle (Joe Hisaishi).mp3"),
							"Gerudo Valley" : ("res://Assets/Music/Gerudo Valley - The Legend of Zelda- Ocarina Of Time.mp3"),
							"Tarantella Napoletana":("res://Assets/Music/Tarantella Napoletana.mp3"),
							"Long elevator": ("res://Assets/Music/Undertale OST- 070 - Long Elevator.mp3"),
							"His theme": ("res://Assets/Music/Undertale OST- 090 - His Theme.mp3"),
							"Tedeschia": ("res://Assets/Music/Was ist dein Lieblingsfach.mp3"),
							"GTA_San Andreas": ("res://Assets/Music/Grand-Theft-Auto-San-Andreas-Theme-Song.mp3")}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body

func _process(delta):
	pass
	
func playMusic(chosenMusic):
	var DefaultMusic = load("res://Assets/Music/Athletic_Ballin_-_New_Super_Mario_Bros._Wii.mp3")
	
	for r in Musics:
		if Musics.has(chosenMusic):
			var tempMusic = load(Musics.get(chosenMusic))
			$AudioStreamPlayer.stream = tempMusic
			$AudioStreamPlayer.play()
		else:
			$AudioStreamPlayer.stream = DefaultMusic
			$AudioStreamPlayer.play()

