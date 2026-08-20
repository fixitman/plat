extends Control
@onready var velocity_y: Label = %VelocityY
@onready var player: Player = %Player
@onready var gravity: Label = %Gravity
@onready var hp: Label = %HP


func _ready() -> void:
	player.hp_changed.connect(update_hp)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player != null:
		velocity_y.text = "Velocity X: " + str(player.velocity.x)
		gravity.text = "Gravity: " + str(player.get_gravity().y)
		hp.text = "wall only: %s     dir: %s" % [player.is_on_wall_only(),str(player.direction)]
	pass


func update_hp(new_hp, max_hp):
	#hp.text = "HP: %s/%s" % [new_hp, max_hp]
	pass
