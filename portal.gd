extends Area2D





func _on_portal_body_entered(body):
	if body.name == "personatge ciutat":
		get_tree().change_scene("res://GUERRA.tscn")
