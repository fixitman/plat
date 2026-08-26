class_name WalkState extends State

@export var jump_state :JumpState
@export var attack_state: AttackState
@export var idle_state :IdleState
@export var wall_state : WallState

@export var SPEED = 200.0


func init() -> void:
	pass

func enter() -> void:
	player.play_animation("walk")
	pass
		
func state_input(event: InputEvent) -> State:
	if event.is_action_pressed("jump") && player.is_on_floor():
		return jump_state
	if event.is_action_pressed("attack"):
		return attack_state
	return null
	
func state_process(_delta: float) -> State:
	return null
	
func state_physics_process(delta: float) -> State:
	player.update_direction()
	if !player.direction :
		return idle_state
	player.update_sprite_flip()
	player.apply_gravity(delta)
	
	player.velocity.x = player.direction * SPEED
	player.move_and_slide()
	
	if Globals.wall_state_enabled && player.is_on_wall():
		return wall_state
	if !player.is_on_floor():
		return jump_state
	return null
		
func exit() -> void:
	pass



	
	
