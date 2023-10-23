extends CharacterBody2D

const speed = 100

@export var player: Node2D
@onready var Nav_agent := $NavigationAgent2D as NavigationAgent2D
@export var steer_force = 50.0

var target = null

func _physics_process(_delta: float) -> void:
	var dir = to_local(Nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	#rotation da sistemare
	move_and_slide()


func makepath() -> void:
	Nav_agent.target_position = player.global_position


func _on_timer_timeout() -> void:
	makepath()
	pass # Replace with function body.
