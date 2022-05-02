extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func _on_Area2D_body_entered(body):
	if body.name=="Paco":
		var escena_label = load("res://label_llop.tscn")
		var escena = escena_label.instance()
		add_child(escena)
		yield(get_tree().create_timer(3), 'timeout')
		get_tree().change_scene("res://escena_pamtera.tscn")
