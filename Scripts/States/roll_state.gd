class_name RollState extends BaseState

func enter() -> void:
	print("roll")
	knight.animated_sprite.play("roll")

func exit() -> void:
	pass

func tick() -> void:
	knight.velocity = knight.direction_to_cursor.normalized() * knight.speed*8
	knight.move_and_slide()
	

func branch() -> BaseState:
	var distance: float = knight.direction_to_cursor.length()

	if distance < knight.attack_range:
		return AttackState.new(knight)
	elif distance < knight.vision_range:
		return ChaseState.new(knight)
	elif distance >= knight.roll_range:
		return IdleState.new(knight)
	return null
