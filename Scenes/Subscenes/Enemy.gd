extends CharacterBody2D

var collision_thread = Thread.new()
var chase = false
var targeted_entity = null
var speed = 150

# turn on chasing if the target entered the enemy area
func _physics_process(delta):
	if chase == true:
		rotation = global_position.angle_to_point(targeted_entity.global_position)
		velocity = Vector2(cos(rotation), sin(rotation)) * speed
		move_and_slide()
	
# if player enters enemy area
func _on_player_detection_body_entered(body):
	if body.name == "Player":
		targeted_entity = body
		chase = true

# if player exits enemy area
func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false

func _on_player_damage_body_entered(body):
	if body.name == "Player":
		body.health -= 1
		$CollisionShape2D.disabled = true
		$PlayerDetection/CollisionShape2D.disabled = true
		$PlayerDamage/CollisionShape2D.disabled = true
		
		disable_collision()
		active_collision()

func disable_collision():
	$".".set_collision_layer(0)
	$".".set_collision_mask(0)

	$PlayerDetection.monitoring = false
	$PlayerDetection/CollisionShape2D.disabled = true
	$PlayerDamage/CollisionShape2D.disabled = true

func active_collision():
	await get_tree().create_timer(3).timeout
	
	$".".set_collision_layer(1)
	$".".set_collision_mask(1)
	$PlayerDetection.monitoring = true
	$PlayerDetection/CollisionShape2D.disabled = false
	$PlayerDamage/CollisionShape2D.disabled = false
