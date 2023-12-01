extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$BookSound.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	$CloseBook.play()
	$BookTimer.start()
	
func _on_book_timer_timeout():
	get_tree().change_scene_to_file("res://FishShop.tscn")


func _on_next_page_pressed():
	$PageFlip.play()
	$FirstPage.hide()
	$SecondPage.show()
	$NextPage.hide()
	$LastPage.show()

func _on_last_page_pressed():
	$PageFlip.play()
	$FirstPage.show()
	$SecondPage.hide()
	$NextPage.show()
	$LastPage.hide()
