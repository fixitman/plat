class_name IdleState extends State

@export var walk_state: State
@export var attack_state: State
@export var jump_state : State


func enter() -> void:
	player.play_animation("idle")
	player.velocity = Vector2.ZERO
	pass
		
func state_input(event: InputEvent) -> State:
	if event.is_action_pressed("jump") && player.is_on_floor():
		return jump_state
	if event.is_action_pressed("attack"):
		return attack_state
	if event.is_action_pressed("move_left") || event.is_action_pressed("move_right"):
		return walk_state
	return null

	
func state_physics_process(delta: float) -> State:
	player.apply_gravity(delta)
	player.update_direction()
	player.update_sprite_flip()
	player.move_and_slide()
	
	if !player.is_on_floor():
		return jump_state
	
	if player.direction:
		return walk_state
	return null
		

		
