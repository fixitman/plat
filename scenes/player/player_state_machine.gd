class_name PlayerStateMachine extends Node

@export var current_state: State 
@export var player: Player
var previous_state: State = null

signal state_chenged(new_state: State)

var states : Array[State] = []

func _ready() -> void:
	for child in get_children():
		if(child is State):
			states.append(child)
			child.player = player
			child.state_machine = self
			
	if states.size() > 0:
		current_state = states[0]
	
	

func _physics_process(delta: float) -> void:
	var new_state = current_state.state_physics_process(delta)
	change_state(new_state)

func _process(delta: float) -> void:
	var new_state = current_state.state_process(delta)
	change_state(new_state)
		
func _unhandled_input(event: InputEvent) -> void:
	var new_state = current_state.state_input(event)
	change_state(new_state)
	
func change_state(new_state : State) -> void:
	if new_state == null || new_state == current_state:
		return
		 
	previous_state = current_state
	if current_state != null:
		current_state.exit()
	
	current_state = new_state
	current_state.enter(previous_state)
	state_chenged.emit(current_state)
	
	
