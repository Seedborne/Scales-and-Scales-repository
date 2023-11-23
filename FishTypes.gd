# FishTypes.gd
extends Resource

class_name FishType

@export var name: String
@export var min_weight: float
@export var max_weight: float
@export var sprite: Texture

# Define several types of fish
static func create_rainbow_trout():
	var fish = FishType.new()
	fish.name = "Rainbow Trout"
	fish.min_weight = 1.0
	fish.max_weight = 15.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_largemouth_bass():
	var fish = FishType.new()
	fish.name = "Largemouth Bass"
	fish.min_weight = 2.0
	fish.max_weight = 22.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish
# ... more fish types ...

static func create_random_fish():
	var choice = randi() % 2  # Adjust the number based on how many fish types you have
	match choice:
		0: return create_rainbow_trout()
		1: return create_largemouth_bass()
		# ... other cases for other fish types ...
