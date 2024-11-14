extends Node2D
class_name Item

@export var item_name: String = "Beak"
@export var number: int = 1
#@export var icom: Texture2D = $Beak
@export var is_stackable: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("items")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
