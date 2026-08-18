class_name JumpState extends State

@export var idle_state: IdleState
@export var walk_state: WalkState
@export var attack_state: AttackState
@export var fall_state: FallState
@export var jump_force: float = 400
@export var air_speed: float = 200

func init() -> void:
	pass

func enter(previous_state: State) -> void:
	if !player.is_on_floor():
		return
	player.play_animation("jump")
	player.velocity.y = -jump_force
	pass
		
func state_input(event: InputEvent) -> State:
	if event.is_action_pressed("attack"):
		return attack_state
	return null
	
func state_process(_delta: float) -> State:
	return null
	
func state_physics_process(delta: float) -> State:
	player.apply_gravity(delta)
	player.update_direction()
	player.update_sprite_flip()
	if player.direction:
		player.velocity.x = player.direction * air_speed
	else:
		player.velocity.x = move_toward(player.velocity.x,0,air_speed * 2 * delta)#should take .5 sec
	player.move_and_slide()
	
	if player.is_on_floor():
		return walk_state if player.direction else idle_state
		
	if player.velocity.y > 0:
		return fall_state
	return null
		
func exit() -> void:
	pass

	
	
		
