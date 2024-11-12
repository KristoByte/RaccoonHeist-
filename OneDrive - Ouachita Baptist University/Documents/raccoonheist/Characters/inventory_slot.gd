extends Button
var item : Item
var quantity : int
@onready var icon : TextureRect = get_node("Icon")
@onready var quantity_text : Label = get_node("QuantityText")
var inventory : inventory
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_item(new_item : Item):
	pass
	
func add_item():
	pass
	
func remove_item():
	pass
	
func update_quantity_text():
	pass
