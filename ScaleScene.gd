extends Control

var inventory_visible = false

func _ready():
	update_inventory_ui()
	if Global.has_sold_fish:
		$DragInstruction.hide()
	else:
		if Global.has_caught_fish:
			$DragInstruction.show()

		
func update_inventory_ui():
	var item_container = $InventoryPanel/ItemContainer
	item_container.queue_free_children()  # Clear current UI items
	
	for item in InventoryManager.inventory_items: #maybe FishShop instead of InventoryManager
		var item_slot = preload("res://ItemSlot.tscn").instantiate()
		item_slot.set_item(item)  # Set up the item_slot with the item data
		item_container.add_child(item_slot)
		print("Inventory item: ", item.name)
		item_slot.connect("item_sold", _on_item_slot_sold)
		await get_tree().process_frame  # Wait for a frame if using containers that auto-arrange children
		item_slot.original_position = item_slot.global_position
		
func _on_item_slot_sold(item):
	$SoldFishSound.play()
	InventoryManager.remove_item(item)  # Remove the item from the inventory data
	print("Item sold signal received for: ", item.name)
	update_item_slots_original_position()
	Global.has_sold_fish = true
	if Global.has_sold_fish:
		$DragInstruction.hide()

func update_item_slots_original_position():
	var item_container = $InventoryPanel/ItemContainer
	print("updated")
	item_container.queue_free_children()  # Clear current UI items
	
	for item in InventoryManager.inventory_items: #maybe FishShop instead of InventoryManager
		var item_slot = preload("res://ItemSlot.tscn").instantiate()
		item_slot.set_item(item)  # Set up the item_slot with the item data
		item_container.add_child(item_slot)
		print("Inventory item: ", item.name)
		item_slot.connect("item_sold", _on_item_slot_sold)
		await get_tree().process_frame  # Wait for a frame if using containers that auto-arrange children
		item_slot.original_position = item_slot.global_position


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://FishShop.tscn")



