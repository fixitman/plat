extends Node
class_name State

var player : CharacterBody2D
var next_state : State = null



func state_process(delta: float) -> void:
	pass
	
func state_physics_process(delta: float) -> void:
	pass
	
func state_input(event: InputEvent) -> void:
	pass
	
func enter() -> void:
	pass
	
func exit() -> void:
	pass
