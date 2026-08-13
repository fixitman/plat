extends Node
class_name State

var player : CharacterBody2D
var next_state : State = null


func init() -> void:
	pass

func state_process(_delta: float) -> void:
	pass
	
func state_physics_process(_delta: float) -> void:
	pass
	
func state_input(_event: InputEvent) -> void:
	pass
	
func enter() -> void:
	pass
	
func exit() -> void:
	pass
