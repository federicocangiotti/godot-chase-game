extends Node2D

@onready var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if($Window.visible == false):
		score += 1
		$UI/Score.text = "Score: " + str(score)
	pass # Replace with function body.
