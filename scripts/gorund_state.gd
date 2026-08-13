class_name GroundState extends State

@export var air_state: State
@export var GRAVITY = 600

func state_physics_process(delta: float) -> void:
	if(!player.is_on_floor()):
		next_state = air_state
	else:
		player.velocity.y += GRAVITY * delta
