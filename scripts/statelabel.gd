extends Label


# Called when the node enters the scene tree for the first time.
@export var state_machine: PlayerStateMachine

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "State: " + state_machine.current_state.name
	pass
