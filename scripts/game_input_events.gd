class_name GameInputEvents

static var direction: Vector2 = Vector2.ZERO
static var cached_direction: Vector2 = Vector2.ZERO

static func calculate_direction() -> Vector2:
	direction = Vector2.ZERO
	
	# Direction		
	if Input.is_action_pressed("walk_down"):
		direction += Vector2.DOWN
	
	if Input.is_action_pressed("walk_up"):
		direction += Vector2.UP
	
	if Input.is_action_pressed("walk_right"):
		direction += Vector2.RIGHT
	
	if Input.is_action_pressed("walk_left"):
		direction += Vector2.LEFT
		
	direction = direction.normalized()
	
	# Si autre direction que 0, on écrase
	if direction != Vector2.ZERO:
		cached_direction = direction
	
	return direction

static func get_direction() -> Vector2:
	return direction

static func get_cached_direction() -> Vector2:
	return cached_direction
