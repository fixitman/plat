extends State

@export var air_state :State
@export var jump_velocity :float
@export var attack_state: State



func state_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		player.velocity.y = jump_velocity
		next_state = air_state
		return
		
	if event.is_action_pressed("attack"):
		next_state = attack_state
		return


func state_physics_process(_delta: float) -> void:
	if !player.is_on_floor():
		next_state = air_state		
		return
	
	if Input.is_action_just_pressed("attack"):
		next_state = attack_state
		return
	
