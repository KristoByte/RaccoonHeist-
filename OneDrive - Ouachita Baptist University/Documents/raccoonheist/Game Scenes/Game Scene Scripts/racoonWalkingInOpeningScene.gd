extends PathFollow2D

var speed = 0.15
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += delta * speed
	
	if progress_ratio == 1:
		$CharacterBody2D/AnimatedSprite2D.play("idle forward")
		if Input.is_action_just_pressed("talk"):
			Dialogic.start("raccoonTalkingToPlayer")
			
	if progress_ratio < 1:
		$CharacterBody2D/AnimatedSprite2D.play("idle right")
