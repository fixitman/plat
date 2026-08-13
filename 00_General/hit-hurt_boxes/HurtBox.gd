class_name HurtBox extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("hurt ready")
	area_entered.connect(on_area_entered)
	pass # Replace with function body.

func on_area_entered(area : Area2D) -> void :
	print("entered")
	if area is not HitBox:
		return
		
	if owner.has_method("take_damage"):
		owner.take_damage(area.damage)
	pass
	
