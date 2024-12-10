extends PathFollow2D

@onready var raccoon
var speed = 0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	raccoon = $CharacterBody2D
	raccoon.inOpeningScene = true
	$CharacterBody2D/AnimatedSprite2D.play("walking backward")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += delta * speed
	
	if progress_ratio < 1:
		$CharacterBody2D/AnimatedSprite2D.play("walking backward")
		
	else:
		raccoon.inOpeningScene = false
	
