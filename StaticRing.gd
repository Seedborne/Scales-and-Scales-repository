extends Sprite2D

func _ready():
	if Global.has_caught_fish:
		$MinigameInstructions.hide()
	else: 
		$MinigameInstructions.show()

func _on_minigame_lose_timeout():
	hide()

func _on_minigame_win_timeout():
	hide()
	Global.has_caught_fish = true
