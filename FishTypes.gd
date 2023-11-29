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

static func create_black_crappie():
	var fish = FishType.new()
	fish.name = "Black Crappie"
	fish.min_weight = 0.25
	fish.max_weight = 5.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_brook_trout():
	var fish = FishType.new()
	fish.name = "Brook Trout"
	fish.min_weight = 0.5
	fish.max_weight = 7.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_snook():
	var fish = FishType.new()
	fish.name = "Snook"
	fish.min_weight = 3.0
	fish.max_weight = 40.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_atlantic_salmon():
	var fish = FishType.new()
	fish.name = "Atlantic Salmon"
	fish.min_weight = 4.0
	fish.max_weight = 30.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_northern_pike():
	var fish = FishType.new()
	fish.name = "Northern Pike"
	fish.min_weight = 5.0
	fish.max_weight = 45.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_mahi_mahi():
	var fish = FishType.new()
	fish.name = "Mahi-Mahi"
	fish.min_weight = 2.0
	fish.max_weight = 50.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_wels_catfish():
	var fish = FishType.new()
	fish.name = "Wels Catfish"
	fish.min_weight = 10.0
	fish.max_weight = 200.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_red_lionfish():
	var fish = FishType.new()
	fish.name = "Red Lionfish"
	fish.min_weight = 0.5
	fish.max_weight = 2.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_koi_carp():
	var fish = FishType.new()
	fish.name = "Koi Carp"
	fish.min_weight = 2.0
	fish.max_weight = 30.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_king_salmon():
	var fish = FishType.new()
	fish.name = "King Salmon"
	fish.min_weight = 10.0
	fish.max_weight = 60.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_pacific_halibut():
	var fish = FishType.new()
	fish.name = "Pacific Halibut"
	fish.min_weight = 50.0
	fish.max_weight = 350.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_japanese_eel():
	var fish = FishType.new()
	fish.name = "Japanese Eel (Unagi)"
	fish.min_weight = 1.0
	fish.max_weight = 6.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_goliath_tigerfish():
	var fish = FishType.new()
	fish.name = "Goliath Tigerfish"
	fish.min_weight = 5.0
	fish.max_weight = 100.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_swordfish():
	var fish = FishType.new()
	fish.name = "Swordfish"
	fish.min_weight = 100.0
	fish.max_weight = 700.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_tuna_yellowfin():
	var fish = FishType.new()
	fish.name = "Tuna (Yellowfin)"
	fish.min_weight = 20.0
	fish.max_weight = 400.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_sturgeon():
	var fish = FishType.new()
	fish.name = "Sturgeon"
	fish.min_weight = 30.0
	fish.max_weight = 500.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_clownfish():
	var fish = FishType.new()
	fish.name = "Clownfish"
	fish.min_weight = 0.05
	fish.max_weight = 0.3
	fish.sprite = preload("res://art/TestFish.png")
	return fish

static func create_blue_marlin():
	var fish = FishType.new()
	fish.name = "Blue Marlin"
	fish.min_weight = 200.0
	fish.max_weight = 1000.0
	fish.sprite = preload("res://art/TestFish.png")
	return fish
# ... more fish types ...

static func create_random_fish():
	var choice = randi() % 20  # Adjust the number based on how many fish types you have
	match choice:
		0: return create_rainbow_trout()
		1: return create_largemouth_bass()
		2: return create_black_crappie()
		3: return create_brook_trout()
		4: return create_snook()
		5: return create_atlantic_salmon()
		6: return create_northern_pike()
		7: return create_mahi_mahi()
		8: return create_wels_catfish()
		9: return create_red_lionfish()
		10: return create_koi_carp()
		11: return create_king_salmon()
		12: return create_pacific_halibut()
		13: return create_japanese_eel()
		14: return create_goliath_tigerfish()
		15: return create_swordfish()
		16: return create_tuna_yellowfin()
		17: return create_sturgeon()
		18: return create_clownfish()
		19: return create_blue_marlin()
		# ... other cases for other fish types ...
