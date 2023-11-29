extends Sprite2D

# Initial scale of the DynamicRing
var initial_scale = Vector2(0.5, 0.5)

# Minimum and maximum scales
var min_scale = Vector2(0.3, 0.3)
var max_scale = Vector2(0.7, 0.7)

# Speed of scaling. Adjust this value to make the ring shrink/grow faster or slower.
var scale_speed = 1.2

# Direction of scaling. 1 for growing, -1 for shrinking.
var scale_direction = -1

func _ready():
	scale = initial_scale

func _process(delta):
	# Update the scale of the DynamicRing
	scale += scale_direction * scale_speed * delta * Vector2(0.5, 0.5)

	# Reverse the direction if limits are reached
	if scale.x <= min_scale.x or scale.x >= max_scale.x:
		scale_direction *= -1
	# Existing scaling logic...

	# Feedback timer logic
	if feedback_timer > 0:
		feedback_timer -= delta
	if feedback_timer <= 0:
		modulate = default_color
		
# Existing variables...
var correct_clicks = 0
var required_correct_clicks = 5
var allowed_mistakes = 1  # This can be increased with stronger lines
var mistake_count = 0

# For feedback
var success_color = Color(0, 1, 0)  # Green for success
var fail_color = Color(1, 0, 0)     # Red for fail
var default_color = modulate        # Default color of the ring
var feedback_duration = 0.2         # Duration for color feedback
var feedback_timer = 0.0
# Existing _ready and _process functions...

var some_tolerance_value = 0.05  # Define this at the top with your other variables

func _input(event):
	if Global.input_enabled and event is InputEventMouseButton and event.pressed: 
		check_ring_alignment()

func check_ring_alignment():
	var static_ring = get_node("../StaticRing")
	
	if abs(scale.x - static_ring.scale.x) < some_tolerance_value:
		# Success
		correct_clicks += 1
		print("hit!")
		modulate = success_color
		feedback_timer = feedback_duration
		if correct_clicks >= required_correct_clicks:
			mini_game_win()
			Global.disable_input()
		# Add any other success logic here
	else:
		# Fail
		mistake_count += 1
		print("miss!")
		modulate = fail_color
		feedback_timer = feedback_duration
		if mistake_count >= allowed_mistakes:
			mini_game_lose()
			Global.disable_input()

func mini_game_lose():
	$MinigameLose.start()
	hide()
	
func mini_game_win():
	$MinigameWin.start()
	hide()
	catch_fish()

func _on_minigame_win_timeout():

	$MinigameEnd.start()

func _on_minigame_lose_timeout():
	
	$MinigameEnd.start()

func _on_minigame_end_timeout():
	
	get_tree().change_scene_to_file(Global.current_fishing_location)
	Global.enable_input()

func catch_fish():
	var caught_fish_type = FishType.create_random_fish()
	var weight = randf_range(caught_fish_type.min_weight, caught_fish_type.max_weight)
	var rounded_weight = round(weight * 100.0) / 100.0  # Round to two decimal places
	var new_fish = FishItem.new()
	new_fish.name = caught_fish_type.name
	new_fish.weight = rounded_weight
	new_fish.sprite = caught_fish_type.sprite
	
	InventoryManager.add_item(new_fish)
	print("Fish added to inventory: ", new_fish.name, ", Weight: ", new_fish.weight)


