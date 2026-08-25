class_name FallState extends State

@export var idle_state: IdleState
@export var walk_state: WalkState
@export var attack_state: AttackState
@export var wall_state: WallState
@export var air_speed: float = 200
@export var max_jump_height: float = 70



var jump_force: float = -sqrt(2 * Globals.gravity * max_jump_height)


func init() -> void:
	pass

func enter(_previous_state: State) -> void:
	player.play_animation("fall")
	pass
		
func state_input(event: InputEvent) -> State:
	if event.is_action_pressed("attack"):
		return attack_state
	return null
	
func state_process(_delta: float) -> State:
	if player.is_on_wall_only() :
		return wall_state
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
	
	if player.is_on_wall_only():
		return wall_state
	if player.is_on_floor():
		return walk_state if player.direction else idle_state
	return null
		
func exit() -> void:
	pass

	
	
		
