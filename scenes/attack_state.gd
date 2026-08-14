class_name AttackState extends State

@onready var hitbox_collider: CollisionShape2D = %CollisionShape2D
@onready var ground_state: State = %GroundState




func state_input(event: InputEvent) -> void:
	pass
		
	


func state_physics_process(_delta: float) -> void:
	pass
	
func enter(previous_state : State) -> void:
	hitbox_collider.disabled = false
	await get_tree().create_timer(.2).timeout
	hitbox_collider.disabled = true
	next_state = previous_state
	
	
