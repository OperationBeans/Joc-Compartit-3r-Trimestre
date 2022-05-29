extends Area2D


func _on_Area2D_body_entered(body):
	if body.name == "cavaller":
		get_tree().change_scene("res://Med4.tscn")
