extends Area2D

func _on_AreaAtac_area_entered(area):
	if area.name == "Area2D":
		area.queue_free()
