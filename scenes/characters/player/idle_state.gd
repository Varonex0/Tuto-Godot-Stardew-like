extends NodeState

@export var player: CharacterBody2D
@export var animated_sprite: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	# Parce que bouger sur une touche trigger le walk, on ne veut que la cached direction
	var direction: Vector2 = GameInputEvents.get_cached_direction()
	
	# Animations (si le perso bouge)
	if direction.x < 0:
		animated_sprite.play("idle_left")
		
	elif direction.x > 0:
		animated_sprite.play("idle_right")
		
	elif direction.y < 0:
		animated_sprite.play("idle_back")
		
	elif direction.y > 0:
		animated_sprite.play("idle_front")

func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transitions() -> void:
	# S'il y a du mouvement	
	if GameInputEvents.calculate_direction() != Vector2.ZERO:
		transition.emit("Walk") # On emit un signal pour que le parent puisse changer de transition

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	pass
