extends CharacterBody2D
class_name Player

@export var SPEED = 100	
@export var JUMP_VELOCITY = -75

var direction : float
@onready var sprite: Sprite2D = $Sprite2D
@onready var statelabel: Label = $statelabel
#@onready var state_machine: PlayerStateMachine = $PlayerStateMachine


func _physics_process(delta: float) -> void:
	

	# Handle jump.
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if is_on_floor():
		direction = Input.get_axis("move_left","move_right")
		if direction < -.1:
			sprite.flip_h = false
		if direction > .1:
			sprite.flip_h = true

		
	if direction :
		velocity.x =  move_toward(velocity.x, direction * SPEED, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
