class_name InventorySlot
extends Button
var item: Item
var quantity: int
@onready var icom: TextureRect = get_node("Icon")
@onready var quantity_text: Label = get_node("QuantityText")
var inventory: Inventory
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_item(new_item: Item):
	item = new_item
	quantity = 1
	
	if item == null:
		icom.visible = false
	else:
		icom.visible = true
		icom.texture = item.icom
		
	update_quantity_text()
	
func add_item():
	quantity += 1
	update_quantity_text()	
func remove_item():
	quantity -= 1
	update_quantity_text()
	if quantity == 0:
		set_item(null)
func update_quantity_text():
	if quantity <= 1:
		quantity_text.text = ""
	else:
		quantity_text.text = str(quantity)
		
#
func _on_pressed():
	if item == null:
		return
	var remove_after_use = item._on_use(inventory.get_parent())
	if remove_after_use:
		remove_item()
