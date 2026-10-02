class_name ChaseState extends BaseState

func enter() -> void:
	print("chase")
	knight.animated_sprite.play("walk")

func exit() -> void:
	pass

func tick() -> void:
	knight.velocity = knight.direction_to_cursor.normalized() * knight.speed
	knight.move_and_slide()

func branch() -> BaseState:
	var distance: float = knight.direction_to_cursor.length()

	if distance < knight.attack_range:
		return AttackState.new(knight)
	elif distance >= knight.vision_range:
		if distance < knight.roll_range:
			return RollState.new(knight)
		else:
			return IdleState.new(knight)

	return null
