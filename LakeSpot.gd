extends Node2D

var bait_effectiveness = 0.2
var mini_game_scene = preload("res://Minigame.tscn")
var mini_game_instance  # Declare it as a member variable
var scene_path = "res://LakeSpot.tscn"  # Manually set the path

func _ready():
	Global.set_fishing_location(scene_path)	
	$BiteCueLabel.hide()  # Ensure the label is hidden at start
	$InventoryButton.connect("pressed", _on_InventoryButton_pressed)
	if Global.has_hooked_fish:
		$BiteInstructions.hide()
	else:
		$BiteInstructions.show()

func show_bite_cue():
	# Show the "Bite!" label
	$BiteCueLabel.show()

func hide_bite_cue():
	# Hide the "Bite!" label
	$BiteCueLabel.hide()

func _on_cast_line_pressed():
	$FishBiteTimer.start()
	$MissedFishLabel.hide()
	$CastLine.hide()
	$CastSound.play()
	print("Line cast!")

func _on_fish_bite_timer_timeout():
	if randf() < bait_effectiveness:
		print("Fish bite!")
		$BiteSound.play()
		show_bite_cue()
		$ReactionTimer.start()
		$FishBiteTimer.stop()
	else:
		print("No bite this time.")

func _on_reaction_timer_timeout():
	hide_bite_cue()
	$MissedFishLabel.show()
	$CastLine.show()
	$MissedFishSound.play()

func _input(event):
	if event is InputEventMouseButton and event.pressed and $ReactionTimer.is_stopped() == false:
		$ReactionTimer.stop()
		hide_bite_cue()
		Global.has_hooked_fish = true
		mini_game_instance = mini_game_scene.instantiate()  # Instantiate the mini-game
		add_child(mini_game_instance)
		start_mini_game()
		if Global.has_hooked_fish:
			$BiteInstructions.hide()

func start_mini_game():
	# Show the existing instance
	$DelayTimer.start()

func _on_delay_timer_timeout():
	mini_game_instance.show()
	
var inventory_visible = false

func _on_InventoryButton_pressed():
	inventory_visible = !inventory_visible
	$InventoryPanel.visible = inventory_visible
	$MenuSelect.play()
	if inventory_visible:
		update_inventory_ui()
	
func update_inventory_ui():
	var item_container = $InventoryPanel/ItemContainer
	item_container.queue_free_children()  # Clear current UI items
	print("updated")

	for item in InventoryManager.inventory_items: #maybe FishShop instead of InventoryManager
		var item_slot = preload("res://ItemSlot.tscn").instantiate()
		item_slot.set_item(item)  # Set up the item_slot with the item data
		item_container.add_child(item_slot)
		await get_tree().process_frame  # Wait for a frame if using containers that auto-arrange children
		item_slot.original_position = item_slot.global_position

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://FishShop.tscn")
