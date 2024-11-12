extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	velocity = direction * SPEED


	move_and_slide()
	
	
func _ready():
	$AnimatedSprite2D.animation = "idle forward"
	$AnimatedSprite2D.play()
