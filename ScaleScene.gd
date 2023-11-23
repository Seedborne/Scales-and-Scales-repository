extends Control

var inventory_visible = false

func _ready():
	$InventoryButton.connect("pressed", _on_InventoryButton_pressed)

func _on_InventoryButton_pressed():
	inventory_visible = !inventory_visible
	$InventoryPanel.visible = inventory_visible
	
func update_inventory_ui():
	var item_container = $InventoryPanel/ItemContainer
	item_container.clear()  # Clear current UI items
	
	for item in InventoryManager.inventory_items: #maybe FishShop instead of InventoryManager
		var item_slot = preload("res://ItemSlot.tscn").instance()
		item_slot.set_item(item)  # Set up the item_slot with the item data
		item_container.add_child(item_slot)

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://FishShop.tscn")
