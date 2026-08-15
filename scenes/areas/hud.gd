extends Control
@onready var velocity_y: Label = %VelocityY
@onready var player: Player = %Player
@onready var gravity: Label = %Gravity


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player != null && player.velocity.y <0:
		velocity_y.text = "Velocity Y: " + str(floor(160 - player.position.y))
		gravity.text = "Gravity: " + str(player.get_gravity().y)
	
	pass
