extends Node

# InventoryManager.gd

var inventory_items = []

func add_item(item):
	inventory_items.append(item)
	print("Current inventory: ", inventory_items)
	
func _on_item_slot_sold(item):
	print("Item sold signal received for: ", item.name)
	InventoryManager.remove_item(item)
	
func remove_item(item):
	if item in inventory_items:
		inventory_items.erase(item)
		print("Item removed: ", item.name)
	else:
		print("Item not found in inventory")
