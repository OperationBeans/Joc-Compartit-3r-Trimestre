extends Area2D





func _on_zonamort_body_entered(body):
	if body.name == "personatge ciutat":
		body.queue_free()
