class_name IdleState extends BaseState

func enter() -> void:
	print("idle")
	knight.animated_sprite.play("idle")

func exit() -> void:
	pass

func tick() -> void:
	pass

func branch() -> BaseState:
	var distance: float = knight.direction_to_cursor.length()

	if distance < knight.attack_range:
		return AttackState.new(knight)
	elif distance < knight.vision_range:
		return ChaseState.new(knight)
	elif distance < knight.roll_range:
		return RollState.new(knight)

	return null
