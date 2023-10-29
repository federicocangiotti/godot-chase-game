extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Score()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func Score():
	var score = 0
	while($"../Window".visibility_changed):
		score += 1
		$"../Score".Text = convert(score, 4)
