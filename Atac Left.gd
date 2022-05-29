extends Area2D





func _on_Atac_Left_body_entered(body):
	if body.name == "cavaller":
		get_tree().change_scene("res://Escena Mort.tscn")
