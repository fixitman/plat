extends Label


# Called when the node enters the scene tree for the first time.
@export var state_machine: PlayerStateMachine

func _ready() -> void:
	if state_machine.current_state:
		text = "State:" + state_machine.current_state.name
		state_machine.state_chenged.connect(update_text)
	pass
	

func update_text(state: State) -> void:
	text = state.name
