class_name HurtBox extends Area2D

signal took_damage(damage : int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = false
	monitorable = true
	pass 


	
func take_damage(damage : int) -> void:
	owner.take_damage(damage)
	pass
