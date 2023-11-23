extends TextureButton

var is_being_dragged = false
var drag_offset

func _gui_input(event):
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
			# Start dragging
				is_being_dragged = true
			drag_offset = get_global_mouse_position() - global_position
		else:
			# Drop
			is_being_dragged = false
			check_drop_location(get_global_mouse_position())

func _process(delta):
	if is_being_dragged:
		global_position = get_global_mouse_position() - drag_offset
		
func check_drop_location(drop_position):
	# Logic to check if the item is dropped over the scale
	# You might need to get a reference to the scale node or its position
	# and check if drop_position is within its bounds

	# Example check (replace with actual scale logic)
	var scale_node = get_node("/path/to/scale_node")
	if scale_node.rect_global_position.has_point(drop_position):
		print("Dropped on scale")
		# Handle the item being weighed
	else:
		print("Dropped elsewhere")
		# Handle invalid drop location
