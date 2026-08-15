extends State

@export var air_state :State
@export var attack_state: State



func state_input(event: InputEvent) -> State:
	if event.is_action_pressed("jump"):
		print("jump" + str(player.jump_velocity))
		player.velocity.y = player.jump_velocity
		return  air_state
		
	if event.is_action_pressed("attack"):
		return attack_state
		
	
	return null


	
	
