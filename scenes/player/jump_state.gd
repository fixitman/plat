class_name JumpState extends State

@export var idle_state: IdleState
@export var walk_state: WalkState
@export var attack_state: AttackState
@export var wall_state: WallState

@export var air_speed: float = 200
@export var max_jump_height: float = 70
@export var gravity : float = 980.0




var jump_force: float 




func init() -> void:
	pass

func enter() -> void:
	if !player.is_on_floor():
		return
		
	jump_force = sqrt(2 * gravity * max_jump_height)	
	
	print("jump force: ",jump_force)
	player.velocity.y = -jump_force
	pass
		
func state_input(event: InputEvent) -> State:
	if event.is_action_pressed("attack"):
		return attack_state
	return null
	
func state_process(_delta: float) -> State:	
	if player.velocity.y <= 0:
		player.play_animation("jump")  
	else:
		player.play_animation("fall")
	return null
	
func state_physics_process(delta: float) -> State:
	#player.apply_gravity(delta)
	player.velocity.y += gravity * delta
	player.update_direction()
	player.update_sprite_flip()
	if player.direction:
		player.velocity.x = player.direction * air_speed
	else:
		player.velocity.x = move_toward(player.velocity.x,0,air_speed * 2 * delta)#should take .5 sec
	player.move_and_slide()
	
	if Globals.wall_state_enabled && player.is_on_wall_only():
		return wall_state
	
	if player.is_on_floor():
		if player.direction:
			return walk_state  
		else:
			return idle_state
	return null
		
func exit() -> void:
	pass

	
	
		
