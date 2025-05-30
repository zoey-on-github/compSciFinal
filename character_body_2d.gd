extends CharacterBody2D
const JUMP_VELOCITY = -900.0
signal playertwokilled

const SPEED = 500.0
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("ground_pound") and !is_on_floor():
		velocity.y = -JUMP_VELOCITY * 5
	move_and_slide()
	var colliders = $CollisionShape2D/RayCast2D.get_collider()
	var colliders2 = str(colliders)
	if colliders2.contains("secondplayer"):
		var player = get_node("../secondplayer")
		if !player.position == Vector2(2133,135):
			player.position = Vector2(2133,135)
			print_debug(colliders2)
			playertwokilled.emit()
		else:
			pass
		#get_tree().reload_current_scene()