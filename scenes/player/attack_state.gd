class_name AttackState extends State

@onready var hitbox_collider: CollisionShape2D = %CollisionShape2D
@onready var ground_state: State = %GroundState

	
func state_process(_delta: float) -> State:
	hitbox_collider.disabled = false
	await get_tree().create_timer(.2).timeout
	hitbox_collider.disabled = true
	return state_machine.previous_state
	
	
