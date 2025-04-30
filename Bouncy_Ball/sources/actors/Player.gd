extends Actor

func	_physics_process(delta: float) -> void:
	var direction: = get_direction()
	velocity = calcutale_move_velocity(velocity, direction, speed)
	velocity = move_and_slide(velocity)
	
func	get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 
		if Input.is_action_just_pressed("jump") and is_on_ceiling()
		else 1.0
	)
	
func	calcutale_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2
	) -> Vector2:
		var new_velocity: = linear_velocity
		new_velocity.x = speed.x * direction.x
		velocity.y += gravity * get_physics_process_delta_time()
		if direction.y == -1.0:
			velocity.y = speed.y * direction.y
		return speed * direction