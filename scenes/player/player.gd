class_name Player extends CharacterBody2D

@export var SPEED = 200.0
@export var jump_velocity = -500.0
@onready var sprite_2d : Sprite2D = $Sprite2D
@export var max_hp :int = 5

var current_hp : int

func _ready() -> void:
	current_hp = max_hp
	pass


func _physics_process(delta: float) -> void:
	
	if !is_on_floor():
		velocity.y += get_gravity().y * delta
		
	
	var direction := Input.get_axis("move_left","move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if velocity.x > .1:
		sprite_2d.scale.x = 1
	else: if velocity.x < -.1:
		sprite_2d.scale.x = -1
		

	move_and_slide()
	pass


func take_damage(damage: int)-> void:
	print("ouch!")
	current_hp -= damage
	if current_hp <= 0:
		queue_free()

 
