extends TextureRect

func is_point_over_scale(global_drop_position):
	# Convert global position to local position within the Control's coordinate space
	var local_drop_position = global_drop_position + size / 4

	print("Global drop position: ", global_drop_position, " Local drop position: ", local_drop_position)
	var is_over = get_rect().has_point(local_drop_position)
	print("Is point over scale: ", is_over)
	return is_over
	

func weigh_fish(fish_item):
	# Code to handle the weighing of the fish
	print("Weighing fish: ", fish_item.name, " Weight: ", fish_item.weight)
	$WeightDisplay.text = str(fish_item.weight) + " lbs"  # Update the weight display text
	# Update UI or game state here
	print("Price: ", fish_item.price_per_pound)
