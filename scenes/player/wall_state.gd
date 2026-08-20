class_name WallState extends State

@export var idle_state: IdleState
@export var walk_state: WalkState
@export var attack_state: AttackState
@export var jump_state : JumpState
@export var jump_force: float = 400
@export var air_speed: float = 200
@export var wall_gravity : float = 450
@export var wall_jump_force: float = 800

var jump_requested : bool = false

func init() -> void:
	pass

func enter(_previous_state: State) -> void:
	player.play_animation("wall")
	player.velocity = Vector2.ZERO
	pass
		
func state_input(event: InputEvent) -> State:
	if event.is_action_pressed("drop"):
		return jump_state
	jump_requested = event.is_action_pressed("jump")
	
	return null
	
func state_process(_delta: float) -> State:
	if !can_wall_slide():
		if player.is_on_floor():
			if player.direction != 0:
				return walk_state
			else:
				return idle_state
		else:
			return jump_state
	return null
	
func state_physics_process(_delta: float) -> State:
	player.update_direction()
	player.update_sprite_flip()
	if jump_requested:
		jump_requested = false
		player.velocity.y = -jump_force
		player.velocity.x = player.get_wall_normal().x * wall_jump_force		
	else:		
		player.velocity.y = wall_gravity 
		player.velocity.x = player.direction * air_speed
	player.move_and_slide()
	
	#if player.is_on_floor():
		#return walk_state if player.direction else idle_state
	#if !player.is_on_wall_only():
		#return fall_state
	return null
		
func exit() -> void:
	pass

func can_wall_slide() -> bool:	
	return player.is_on_wall() 
	
		
