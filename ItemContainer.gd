extends GridContainer

func queue_free_children():
	for child in get_children():
		child.queue_free()
