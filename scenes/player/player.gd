class_name Player extends CharacterBody2D

@export var max_hp :int = 100

@onready var sprite_2d : Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = %AnimationPlayer

signal hp_changed(new_hp : int, max_hp)

var current_hp : int
var direction : float

func _ready() -> void:	
	#Engine.time_scale = .25
	
	current_hp = max_hp
	hp_changed.emit(current_hp,max_hp)
	pass


func take_damage(damage: int)-> void:
	print("ouch!")
	var prev_hp = current_hp
	current_hp -= damage
	current_hp = clamp(current_hp,0,max_hp)
	if current_hp != prev_hp:
		hp_changed.emit(current_hp, max_hp)
	
	if current_hp == 0:
		queue_free()

func play_animation(anim : String):
	if anim == "attack":
		animation_player.play(anim)
	pass
	
func update_sprite_flip():
	if velocity.x > .1:
		sprite_2d.scale.x = 1
	elif velocity.x < -.1:
		sprite_2d.scale.x = -1
		
func update_direction():
	direction = Input.get_axis("move_left","move_right")
	
func apply_gravity(delta):
	if !is_on_floor():
		velocity.y += get_gravity().y * delta
	
	
	
	
	
	
	
 
