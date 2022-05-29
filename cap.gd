extends Area2D


func _on_cap_body_entered(body):
	if body.name == "cavaller":
		body.queue_free()
		get_tree().change_scene("res://Escena Mort.tscn")
