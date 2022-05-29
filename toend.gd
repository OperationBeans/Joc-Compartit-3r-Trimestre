extends Area2D





func _on_canvi_body_entered(body):
	if body.name == "cavaller":
		get_tree().change_scene("res://dalt castell.tscn")
