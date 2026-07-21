extends Path2D

@export var duration := 3.0
@export var return_trip := false

@onready var path_follow_2d: PathFollow2D = $PathFollow2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	var tween = create_tween()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops()
	tween.tween_property(path_follow_2d, "progress_ratio",1.0,duration)
	if return_trip:
		tween.tween_property(path_follow_2d, "progress_ratio",0,duration)
	else:
		tween.tween_property(path_follow_2d, "progress_ratio",0,0)
	
	
	
	
