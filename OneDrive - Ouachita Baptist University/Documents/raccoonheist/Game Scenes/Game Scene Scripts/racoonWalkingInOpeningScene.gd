extends PathFollow2D

var speed = 0.15
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += delta * speed
	
	#if progress_ratio == 0.95:
		#speed = 0
