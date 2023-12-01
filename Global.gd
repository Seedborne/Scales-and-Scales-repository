extends Node

var current_fishing_location = ""

func set_fishing_location(location_path: String):
	current_fishing_location = location_path
	
var input_enabled = true
var has_sold_fish = false
var has_caught_fish = false
var has_hooked_fish = false

func disable_input():
	if input_enabled:
		input_enabled = false
		
func enable_input():
	input_enabled = true
