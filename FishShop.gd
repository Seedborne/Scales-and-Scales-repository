extends Control

var is_river_unlocked = false
var is_ocean_unlocked = false

# ... [other code]

func unlock_location(location):
	match location:
		"River":
			is_river_unlocked = true
			# Send update to FishingLocations scene
			update_location_buttons()
		"Ocean":
			is_ocean_unlocked = true
			# Send update to FishingLocations scene
			update_location_buttons()

func update_location_buttons():
	var fishing_locations_scene = get_node("path_to_FishingLocations_scene")
	if fishing_locations_scene:
		fishing_locations_scene.update_buttons(is_river_unlocked, is_ocean_unlocked)

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

func _on_scale_pressed():
	get_tree().change_scene_to_file("res://ScaleScene.tscn")
