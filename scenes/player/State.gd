extends Node
class_name State

var player : Player
var state_machine : PlayerStateMachine


func init() -> void:
	pass

func enter() -> void:
	pass
		
func state_input(_event: InputEvent) -> State:
	return null

func state_physics_process(_delta: float) -> State:
	return null
	
func state_process(_delta: float) -> State:
	return null
		
func exit() -> void:
	pass
