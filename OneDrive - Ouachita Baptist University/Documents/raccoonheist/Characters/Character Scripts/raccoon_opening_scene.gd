extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	velocity = direction * SPEED


	move_and_slide()
	
func _process(delta):
	if ($AnimatedSprite2D.animation == "walking forward"):
		$CollisionShape2D.scale.x = 4.56
		$CollisionShape2D.scale.y = 5.2
	else if ($AnimatedSprite2D.animation == "walking left"):
		$CollisionShape2D.scale.x = 4.56
		$CollisionShape2D.scale.y = 5.2
