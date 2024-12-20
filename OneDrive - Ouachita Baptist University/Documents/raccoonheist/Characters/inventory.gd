class_name Inventory
extends Node2D

@onready var window : Panel = get_node("Inventory Window")
@onready var info_text : Label = get_node("Inventory Window/InfoText")
@export var starter_items : Array[Item]
var slots : Array[InventorySlot]

# Called when the node enters the scene tree for the first time.
func _ready():
	toggle_window(false)
	for child in get_node("Inventory Window/SlotContainer").get_children():
		slots.append(child)
		child.set_item(null)
		child.inventory = self
	#for item in starter_items:
		#add_item(item)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("inventory"):
		toggle_window(!window.visible)

func toggle_window (open: bool):
	window.visible = open
	
	if open:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func on_give_player_item (item: Item, amount: int):
	pass
	
func add_item (item: Item):
	var slot = get_slot_to_add(item)
	
	if slot == null:
		return
	
	if slot.item == null:
		slot.set_item(item)
	elif slot.item == item:
		slot.add_item()

func remove_item (item: Item):
	var slot = get_slot_to_remove(item)
	
	if slot == null or slot.item == item:
		return
	
	slot.remove_item()

func get_slot_to_add (item: Item) -> InventorySlot:
	for slot in slots:
		if slot.item == item and slot.quantity < item.max_stack_size:
			return slot
	for slot in slots:
		if slot.item == null:
			return slot
	
	return null

func get_slot_to_remove (item: Item) -> InventorySlot:
	for slot in slots:
		if slot.item == item:
			return slot
	return null

func get_number_of_item (item: Item) -> int:
	var total = 0
	
	for slot in slots:
		if slot.item == item:
			total += slot.quantity
	
	return total
