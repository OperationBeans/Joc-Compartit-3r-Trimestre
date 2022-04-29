extends Area2D

func _on_Area2D_body_entered(body):
	if body.name=="Paco":
		var escena_label = load("res://LABEL.tscn")
		var escena_label_bona = escena_label.instance()
		add_child(escena_label_bona)
		
