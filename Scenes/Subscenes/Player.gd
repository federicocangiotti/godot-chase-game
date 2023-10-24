extends CharacterBody2D

# player health
var health = 1
# -1000 great break, -100 poor brake 
var braking
# 20 - 45
var steering_angle = 30
# 100 - 1000
var engine_power = 900
# speed limit for reverse
var max_speed_reverse = 300
var wheel_base = 70

var traction_fast = 10
var traction_slow = 10
var friction = -1
var drag = -0.1
var slip_speed = 100

var acceleration = Vector2.ZERO
var steer_direction

func _ready():
	$Area2D/Sprite2D.texture = ResourceLoader.load(Global.selected_player.sprite)
	braking = Global.selected_player.braking
	engine_power = 	Global.selected_player.engine_power
	max_speed_reverse = Global.selected_player.max_speed_reverse

func _physics_process(delta):
	acceleration = Vector2.ZERO
	get_input()
	apply_friction(delta)
	calculate_steering(delta)
	velocity += acceleration * delta
	move_and_slide()
	
	if health <= 0:
		queue_free()
		$"../Window".visible = true
	
func apply_friction(delta):
	if acceleration == Vector2.ZERO and velocity.length() < 50:
		velocity = Vector2.ZERO
	var friction_force = velocity * friction * delta
	var drag_force = velocity * velocity.length() * drag * delta
	acceleration += drag_force + friction_force
	
func get_input():
	var turn = Input.get_axis("steer_left", "steer_right")
	steer_direction = turn * deg_to_rad(steering_angle)
	if Input.is_action_pressed("accelerate"):
		acceleration = transform.x * engine_power
	if Input.is_action_pressed("brake"):
		acceleration = transform.x * braking
	
func calculate_steering(delta):
	var rear_wheel = position - transform.x * wheel_base / 2.0
	var front_wheel = position + transform.x * wheel_base / 2.0
	rear_wheel += velocity * delta
	front_wheel += velocity.rotated(steer_direction) * delta
	var new_heading = rear_wheel.direction_to(front_wheel)
	var traction = traction_slow
	if velocity.length() > slip_speed:
		traction = traction_fast
	var d = new_heading.dot(velocity.normalized())
	if d > 0:
		velocity = lerp(velocity, new_heading * velocity.length(), traction * delta)
	if d < 0:
		velocity = -new_heading * min(velocity.length(), max_speed_reverse)
#	velocity = new_heading * velocity.length()
	rotation = new_heading.angle()


