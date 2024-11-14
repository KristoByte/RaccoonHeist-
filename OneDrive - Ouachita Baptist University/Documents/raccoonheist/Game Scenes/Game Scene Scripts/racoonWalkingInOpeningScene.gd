extends PathFollow2D

var speed = 0.15
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += delta * speed
	
	if progress_ratio == 1:
		$CharacterBody2D/AnimatedSprite2D.play("idle forward")
		if Input.is_action_just_pressed("talk"):
			Dialogic.start("raccoonTalkingToPlayer")
		
			
	if progress_ratio < 1:
		$CharacterBody2D/AnimatedSprite2D.play("idle right")

func _on_dialogic_signal(argument: String):
	if argument == "change_scene":
		get_tree().change_scene_to_file("res://Game Scenes/MissingParts.tscn")
