class_name HitBox extends Area2D

@export var damage: int = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = true
	monitorable = false
	
	area_entered.connect( on_area_entered)
	pass # Replace with function body.


func on_area_entered(area : Area2D) -> void:
	if area == null or area is not HurtBox:
		return
	
	if area.has_method("take_damage"):
		area.take_damage(damage)
	
	
		
