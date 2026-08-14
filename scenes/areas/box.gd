extends StaticBody2D

@export var hp = 25


func take_damage(damage : int)-> void:
	hp -= damage
	if hp <= 0:
		queue_free()
