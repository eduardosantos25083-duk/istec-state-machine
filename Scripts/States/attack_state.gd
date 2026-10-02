class_name AttackState extends BaseState

func enter() -> void:
	print("attack")
	knight.animated_sprite.play("attack")

func exit() -> void:
	pass

func tick() -> void:
	pass

func branch() -> BaseState:
	var distance: float = knight.direction_to_cursor.length()

	if distance >= knight.attack_range:
		if distance < knight.vision_range:
			return ChaseState.new(knight)
		elif distance < knight.roll_range:
			return RollState.new(knight)
		else:
			return IdleState.new(knight)

	return null
