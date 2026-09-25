class_name RollState extends BaseState

func enter() -> void:
	knight.animated_sprite.play("roll")

func exit() -> void:
	pass

func tick() -> void:
	pass

func branch() -> BaseState:
	var within_vision: bool = knight.cursor_within_vision_range()
	var within_roll: bool = knight.cursor_within_roll_range()
	var within_attack: bool = knight.cursor_within_attack_range()

	if not within_vision:
		return IdleState.new(knight)
	elif not within_roll:
		return RollState.new(knight)
	elif not within_attack:
		return ChaseState.new(knight)
	else:
		return null
