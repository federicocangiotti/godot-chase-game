extends CharacterBody2D

const speed = 100

@export var player: Node2D
@onready var Nav_agent := $NavigationAgent2D as NavigationAgent2D
#@export var steer_force = 50.0
#
#var target = null

func _physics_process(_delta: float) -> void:
	var dir = to_local(Nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	Nav_agent.target_position = player.global_position
	$Area2D/Sprite2D.global_rotation = $Area2D/Sprite2D.global_position.angle_to_point(Nav_agent.target_position)
	move_and_slide()

func _on_area_2d_body_entered(body):
	print("PROVA")
	queue_free()
	$"../Window".visible = true
	
	pass # Replace with function body.

#func _on_timer_timeout() -> void:
#	makepath()
#	pass # Replace with function body. t



