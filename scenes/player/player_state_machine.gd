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
			

func _physics_process(delta: float) -> void:
	change_state(current_state.state_physics_process(delta))

func _process(delta: float) -> void:
	change_state(current_state.state_process(delta))
		
func _input(event: InputEvent) -> void:
	change_state(current_state.state_input(event))
	
func change_state(new_state : State) -> void:
	if new_state == null || new_state == current_state:
		return
		 
	previous_state = current_state
	if current_state != null:
		current_state.exit()
	
	current_state = new_state
	current_state.enter(previous_state)
	state_chenged.emit(current_state)
	
	
