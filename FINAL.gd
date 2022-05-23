extends Area2D


func _process(delta):
	 position.x -= 2


func _on_FINAL_area_entered(area):
	if area.name == "maquina":
		queue_free()
