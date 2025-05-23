extends CharacterBody2D
const JUMP_VELOCITY = -900.0

const SPEED = 500.0
const inputs = {}
const tile_size = 64
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump2") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left2", "move_right2")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("ground_pound2") and !is_on_floor():
		velocity.y = JUMP_VELOCITY * -1
	move_and_slide()
