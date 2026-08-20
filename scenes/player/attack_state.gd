class_name AttackState extends State

@onready var hitbox_collider: CollisionShape2D = %CollisionShape2D

@export var idle_state : IdleState
@export var jump_state : JumpState

	
func enter(_previous_state: State) -> void:
	player.play_animation("attack")
	player.animation_player.animation_finished.connect(on_animation_finished)

func on_animation_finished(_anim: String):
	if player.is_on_floor():
		state_machine.change_state(idle_state)
	else:
		state_machine.change_state(jump_state)	
	
	
func state_physics_process(delta: float) -> State:
	player.apply_gravity(delta)
	player.move_and_slide()
	return null
	
func exit() -> void:
	player.animation_player.animation_finished.disconnect(on_animation_finished)
