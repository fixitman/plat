class_name AirState extends State

@export var ground_state: State
@export var attack_state: State

func state_physics_process(delta: float) -> State: 
	
	if player.is_on_floor():
		return ground_state
		
	return null
		
	
func state_input(event: InputEvent) -> State:
	if event.is_action_pressed("attack"):
		return attack_state
	elif(player.is_on_floor()):
		return ground_state
	else: 
		return null
	
	
		
