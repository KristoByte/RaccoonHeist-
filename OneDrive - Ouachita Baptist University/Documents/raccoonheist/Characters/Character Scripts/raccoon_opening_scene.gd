extends CharacterBody2D


const SPEED = 100.0

var inOpeningScene
var directionFacing


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	# As good practice, you should replace UI actions with custom gameplay actions.
	velocity = direction * SPEED
	if (!inOpeningScene):
		move_and_slide()

func _ready():
	$AnimatedSprite2D.play("walking right")
	directionFacing = "south"
	

func _process(delta):
	move_and_slide()

	if ($AnimatedSprite2D.animation == "idle backward"):
		get_node("CollisionShapeIdleBackward").disabled = false
		get_node("CollisionShapeIdleForward").disabled = true
		get_node("CollisionShapeIdleLeft").disabled = true
		get_node("CollisionShapeIdleRight").disabled = true
		get_node("CollisionShapeWalkingForward").disabled = true
		get_node("CollisionShapeWalkingLeft").disabled = true
		get_node("CollisionShapeWalkingRight").disabled = true
	elif ($AnimatedSprite2D.animation == "idle forward"):
		get_node("CollisionShapeIdleBackward").disabled = true
		get_node("CollisionShapeIdleForward").disabled = false
		get_node("CollisionShapeIdleLeft").disabled = true
		get_node("CollisionShapeIdleRight").disabled = true
		get_node("CollisionShapeWalkingForward").disabled = true
		get_node("CollisionShapeWalkingLeft").disabled = true
		get_node("CollisionShapeWalkingRight").disabled = true
	elif ($AnimatedSprite2D.animation == "idle left"):
		get_node("CollisionShapeIdleBackward").disabled = true
		get_node("CollisionShapeIdleForward").disabled = true
		get_node("CollisionShapeIdleLeft").disabled = false
		get_node("CollisionShapeIdleRight").disabled = true
		get_node("CollisionShapeWalkingForward").disabled = true
		get_node("CollisionShapeWalkingLeft").disabled = true
		get_node("CollisionShapeWalkingRight").disabled = true
	elif ($AnimatedSprite2D.animation == "idle right"):
		get_node("CollisionShapeIdleBackward").disabled = true
		get_node("CollisionShapeIdleForward").disabled = true
		get_node("CollisionShapeIdleLeft").disabled = true
		get_node("CollisionShapeIdleRight").disabled = false
		get_node("CollisionShapeWalkingForward").disabled = true
		get_node("CollisionShapeWalkingLeft").disabled = true
		get_node("CollisionShapeWalkingRight").disabled = true
	elif ($AnimatedSprite2D.animation == "walking forward"):
		get_node("CollisionShapeIdleBackward").disabled = true
		get_node("CollisionShapeIdleForward").disabled = true
		get_node("CollisionShapeIdleLeft").disabled = true
		get_node("CollisionShapeIdleRight").disabled = true
		get_node("CollisionShapeWalkingForward").disabled = false
		get_node("CollisionShapeWalkingLeft").disabled = true
		get_node("CollisionShapeWalkingRight").disabled = true
	elif ($AnimatedSprite2D.animation == "walking left"):
		get_node("CollisionShapeIdleBackward").disabled = true
		get_node("CollisionShapeIdleForward").disabled = true
		get_node("CollisionShapeIdleLeft").disabled = true
		get_node("CollisionShapeIdleRight").disabled = true
		get_node("CollisionShapeWalkingForward").disabled = true
		get_node("CollisionShapeWalkingLeft").disabled = false
		get_node("CollisionShapeWalkingRight").disabled = true
	elif ($AnimatedSprite2D.animation == "walking right"):
		get_node("CollisionShapeIdleBackward").disabled = true
		get_node("CollisionShapeIdleForward").disabled = true
		get_node("CollisionShapeIdleLeft").disabled = true
		get_node("CollisionShapeIdleRight").disabled = true
		get_node("CollisionShapeWalkingForward").disabled = true
		get_node("CollisionShapeWalkingLeft").disabled = true
		get_node("CollisionShapeWalkingRight").disabled = false
		
		
	if (!inOpeningScene):
		if Input.is_action_pressed("up"):
			$AnimatedSprite2D.play("walking backward")
			directionFacing = "north"
		elif Input.is_action_pressed("right"):
			$AnimatedSprite2D.play("walking right")
			directionFacing = "east"
		elif Input.is_action_pressed("down"):
			$AnimatedSprite2D.play("walking forward")
			directionFacing = "south"
		elif Input.is_action_pressed("left"):
			$AnimatedSprite2D.play("walking left")
			directionFacing = "west"
		else:
			if directionFacing == "north":
				$AnimatedSprite2D.play("idle backward")
			elif directionFacing == "east":
				$AnimatedSprite2D.play("idle right")
			elif directionFacing == "south":
				$AnimatedSprite2D.play("idle forward")
			else:
				$AnimatedSprite2D.play("idle left")
		

	if Input.is_action_pressed("up"):
		$AnimatedSprite2D.play("walking forward")
		$AnimatedSprite2D.animation = "walking backward"
		directionFacing = "north"
	elif Input.is_action_pressed("right"):
		$AnimatedSprite2D.play("walking right")
		directionFacing = "east"
	elif Input.is_action_pressed("down"):
		$AnimatedSprite2D.play("walking forward")
		directionFacing = "south"
	elif Input.is_action_pressed("left"):
		$AnimatedSprite2D.play("walking left")
		directionFacing = "west"
	else:
		if directionFacing == "north":
			$AnimatedSprite2D.animation = "idle backward"
		elif directionFacing == "east":
			$AnimatedSprite2D.animation = "idle right"
		elif directionFacing == "south":
			$AnimatedSprite2D.animation = "idle forward"
		else:
			$AnimatedSprite2D.animation = "idle left"
	
