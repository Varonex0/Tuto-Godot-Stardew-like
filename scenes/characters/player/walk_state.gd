extends NodeState

@export var player: CharacterBody2D
@export var animated_sprite: AnimatedSprite2D
@export var speed: int = 50

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.calculate_direction()
	
	# Animations (si le perso bouge)
	if direction.x < 0:
		animated_sprite.play("walk_left")
		
	elif direction.x > 0:
		animated_sprite.play("walk_right")
		
	elif direction.y < 0:
		animated_sprite.play("walk_back")
		
	elif direction.y > 0:
		animated_sprite.play("walk_front")
		
	# Mouvement
	player.velocity = direction * speed
	player.move_and_slide()

func _on_next_transitions() -> void:
	# Si on ne bouge plus	
	if GameInputEvents.get_direction() == Vector2.ZERO:
		transition.emit("Idle") # On passe en idle

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	pass
