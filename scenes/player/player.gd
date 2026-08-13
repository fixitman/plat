class_name Player extends CharacterBody2D


@export var SPEED = 200.0
@export var JUMP_VELOCITY = -500.0
@onready var sprite_2d : Sprite2D = $Sprite2D
@export var max_hp :int = 5



var current_hp : int

func _ready() -> void:
	current_hp = max_hp


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left","move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if velocity.x > .1:
		sprite_2d.flip_h = true
	else: if velocity.x < -.1:
		sprite_2d.flip_h = false
		

	move_and_slide()


func take_damage(damage: int)-> void:
	print("ouch!")
	current_hp -= damage
	if current_hp <= 0:
		queue_free()

 
