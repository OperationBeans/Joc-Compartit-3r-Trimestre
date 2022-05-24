extends Area2D



func _on_change_to_area_entered(area):
	if area.name == "pako":
		get_tree().change_scene("res://Nivell1.tscn")
