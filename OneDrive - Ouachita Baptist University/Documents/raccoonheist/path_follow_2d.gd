extends PathFollow2D

@onready var raccoon
var speed = 0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	raccoon = $CharacterBody2D
	raccoon.inOpeningScene = true
	$CharacterBody2D/AnimatedSprite2D.play("walking backward")
	Dialogic.signal_event.connect(_on_dialogic_signal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += delta * speed
	
	if progress_ratio < 1:
		$CharacterBody2D/AnimatedSprite2D.play("walking backward")
		
	else:
		raccoon.inOpeningScene = false
		if Input.is_action_just_pressed("talk"):
			Dialogic.start("talkingtochef")
	
	
func _on_dialogic_signal(argument: String):
	if argument == "change_scene":
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		raccoon.inOpeningScene = false
		get_tree().change_scene_to_file("res://m_menu.tscn")
