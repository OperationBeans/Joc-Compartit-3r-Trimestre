extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _process(delta):
	colpeja()
		

func colpeja():
	var escena = load("res://bala militar.tscn")
	var bala = escena.instance()
	bala.global_position = global_position
	Global.Bales.add_child(bala)
