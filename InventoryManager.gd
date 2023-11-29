extends Node

# InventoryManager.gd

var inventory_items = []

func add_item(item):
	inventory_items.append(item)
	print("Current inventory: ", inventory_items)
	
func remove_item(item):
	inventory_items.erase(item)
