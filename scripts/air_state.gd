class_name AirState extends State

@export var ground_state: State
@export var GRAVITY = 600
@onready var attack_state: AttackState = %AttackState

func state_physics_process(delta: float) -> void:
	
	if !player.is_on_floor():
		player.velocity.y += GRAVITY * delta
	
	if Input.is_action_just_pressed("attack"):
		next_state = attack_state
	elif(player.is_on_floor()):
		next_state = ground_state
		
