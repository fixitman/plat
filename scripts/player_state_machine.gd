class_name PlayerStateMachine extends Node

@export var current_state: State 
@export var player: Player
var previous_state: State = null

var states : Array[State] = []

func _ready() -> void:
	for child in get_children():
		if(child is State):
			states.append(child)
			child.player = player
			

func _physics_process(delta: float) -> void:
	current_state.state_physics_process(delta)

func _process(_delta: float) -> void:
	if current_state.next_state != null:
		switch_states(current_state.next_state)
		
func _input(event: InputEvent) -> void:
	current_state.state_input(event)
	
func switch_states(new_state : State) -> void:
	previous_state = current_state
	if current_state != null:
		current_state.exit()
		current_state.next_state = null
	
	current_state = new_state
	current_state.enter(previous_state)
	
	
