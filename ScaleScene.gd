extends Control

var inventory_visible = false

func _ready():
	update_inventory_ui()
		
func update_inventory_ui():
	var item_container = $InventoryPanel/ItemContainer
	item_container.queue_free_children()  # Clear current UI items
	
	for item in InventoryManager.inventory_items: #maybe FishShop instead of InventoryManager
		var item_slot = preload("res://ItemSlot.tscn").instantiate()
		item_slot.set_item(item)  # Set up the item_slot with the item data
		item_container.add_child(item_slot)

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://FishShop.tscn")



