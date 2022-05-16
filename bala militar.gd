extends Area2D

var velocitat :Vector2
func _process(delta):
	position += velocitat



func _on_bala_militar_area_entered(area):
	if area.name == "Area2D" or area.name== "helicopter":
		pass
	else:
		queue_free()


func _on_bala_militar_body_entered(body):
	if body.name == "Personatge-era-militar":
		body.queue_free()
