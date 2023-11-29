extends TextureButton

var is_being_dragged = false
var drag_offset
var item_data = null
var original_position = Vector2()
var is_draggable = true

func set_item(item):
	item_data = item
	
	$FishName.text = item.name  # Set the fish name
	$FishSprite.texture = item.sprite  # Set the sprite texture
	
func set_draggable(can_drag):
	is_draggable = can_drag
	
func _gui_input(event):
	if is_draggable:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
			# Start dragging
				is_being_dragged = true
				drag_offset = get_global_mouse_position() - global_position
				z_index = 1 # Optional: Raise the z-index to make it render above other items
			else:
			# Drop
				is_being_dragged = false
				z_index = 0  # Reset z-index
				check_drop_location(get_global_mouse_position())

func _process(delta):
	if is_being_dragged:
		global_position = get_global_mouse_position() - drag_offset

func check_drop_location(drop_position):
	var scale_node = get_node_or_null("/root/ScaleScene/ScaleNode")  # Adjust the path to your scale node
	
	if scale_node and scale_node.is_point_over_scale(global_position):
		print("Dropped on scale")
		scale_node.weigh_fish(item_data)
		set_draggable(false)
		$SellFish.show()
		$BackToInventory.show()
	else:
		print("Dropped elsewhere")
		reset_to_original_position()  # Call a function to reset the fish item's position
		# Handle invalid drop location
	
func reset_to_original_position():
	position = original_position  # Reset the position of the item
	is_being_dragged = false  # Ensure dragging is stopped

	
func _on_back_to_inventory_pressed():
	reset_to_original_position()
	set_draggable(true)
	$SellFish.hide()
	$BackToInventory.hide()

func _on_sell_fish_pressed():
	queue_free()
	InventoryManager.remove_item
	$SellFish.hide()
	$BackToInventory.hide()
