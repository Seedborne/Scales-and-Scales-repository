extends Control

var river_button
var ocean_button

func _ready():
	river_button = $RiverButton  # Adjust the path to your River button
	ocean_button = $OceanButton  # Adjust the path to your Ocean button
	# Initialize button states
	update_buttons(true, true)

func update_buttons(is_river_unlocked, is_ocean_unlocked):
	river_button.disabled = !is_river_unlocked
	ocean_button.disabled = !is_ocean_unlocked

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://FishShop.tscn")
