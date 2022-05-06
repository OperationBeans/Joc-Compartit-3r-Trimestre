extends Area2D


func on_timeout():
	get_tree().change_scene("res://escena_pamtera.tscn")

func _on_Area2D_body_entered(body):
	if body.name=="Paco":
		var timer = Timer.new()
		timer.set_one_shot(true)
		timer.set_wait_time(7)
		timer.connect("timeout", self, "on_timeout")
		add_child(timer)
		timer.start()

		var escena_label = load("res://label_llop.tscn")
		var escena = escena_label.instance()
		add_child(escena)
