extends State

@export var air_state :State
@export var jump_velocity :float



func state_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		player.velocity.y = jump_velocity
		next_state = air_state


func state_physics_process(_delta: float) -> void:
	if !player.is_on_floor():
		next_state = air_state		
	pass
	
