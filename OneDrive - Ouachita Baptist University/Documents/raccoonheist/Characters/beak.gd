extends Node2D
class_name Item
signal foundB
#@export var icom: Texture2D = $Beak

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(_delta):
	$BeakN.hide()
	foundB.emit()
