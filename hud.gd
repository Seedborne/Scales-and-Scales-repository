extends CanvasLayer

var money: float = 0.0  # Initialize with starting money

# Reference to the MoneyLabel node
@onready var money_label: Label = $MoneyLabel

func _ready():
	call_deferred("update_money_display") # Update the money display when the HUD is ready

# Function to add money, call this when a fish is sold
func add_money(amount: float):
	money += amount
	print("Adding money: ", amount, " New total: ", money)
	update_money_display()

# Function to update the money display
func update_money_display():
	var money_label = get_node("/root/Hud/MoneyLabel")
	if money_label:
		money_label.text = "$" + str(money)
		print("Money Label updated to: ", money_label.text)
	else:
		print("MoneyLabel node is null or not ready.")
