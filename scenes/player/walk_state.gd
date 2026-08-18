class_name WalkState extends State

@export var jump_state :State
@export var attack_state: State
@export var idle_state : State
@export var SPEED = 200.0


func init() -> void:
	pass

func enter(previous_state: State) -> void:
	player.play_animation("walk")
	pass
		
func state_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("jump") && player.is_on_floor():
		return jump_state
	if _event.is_action_pressed("attack"):
		return attack_state
	return null
	
func state_process(_delta: float) -> State:
	return null
	
func state_physics_process(delta: float) -> State:
	player.update_direction()
	player.update_sprite_flip()
	player.apply_gravity(delta)
	if !player.direction :
		return idle_state
	
	player.velocity.x = player.direction * SPEED
	player.move_and_slide()
	
	if !player.is_on_floor():
		return jump_state
	return null
		
func exit() -> void:
	pass



	
	
