extends Area2D

func _on_AreaAtac_area_entered(area):
	area.queue_free()



