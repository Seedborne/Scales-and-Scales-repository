extends Node2D

var bait_effectiveness = 0.2
var mini_game_scene = preload("res://Minigame.tscn")
var mini_game_instance  # Declare it as a member variable
var scene_path = "res://RiverSpot.tscn"  # Manually set the path

func _ready():
	Global.set_fishing_location(scene_path)	
	$BiteCueLabel.hide()  # Ensure the label is hidden at start

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
	print("Line cast!")

func _on_fish_bite_timer_timeout():
	if randf() < bait_effectiveness:
		print("Fish bite!")
		show_bite_cue()
		$ReactionTimer.start()
		$FishBiteTimer.stop()
	else:
		print("No bite this time.")

func _on_reaction_timer_timeout():
	hide_bite_cue()
	$MissedFishLabel.show()
	$CastLine.show()

func _input(event):
	if event is InputEventMouseButton and event.pressed and $ReactionTimer.is_stopped() == false:
		$ReactionTimer.stop()
		hide_bite_cue()
		mini_game_instance = mini_game_scene.instantiate()  # Instantiate the mini-game
		add_child(mini_game_instance)
		start_mini_game()

func start_mini_game():
	# Show the existing instance
	$DelayTimer.start()

func _on_delay_timer_timeout():
	mini_game_instance.show()
