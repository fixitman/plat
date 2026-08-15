extends Node
class_name State

var player : CharacterBody2D
var state_machine : PlayerStateMachine


func init() -> void:
	pass

func state_process(_delta: float) -> State:
	return null

	
func state_physics_process(_delta: float) -> State:
	return null
	
	
func state_input(_event: InputEvent) -> State:
	return null
	
func enter(previous_state: State) -> void:
	pass
	
func exit() -> void:
	pass
