extends Area2D

var pot_disparar = true

func _ready():
	$Timer.start()
#func _process(delta):
#	colpeja()
#

func colpeja():
#	if not pot_disparar:
#		return
#	pot_disparar = false
	$Timer.start()
	var escena = load("res://bala militar.tscn")
	var bala = escena.instance()
	bala.global_position = global_position
	Global.Bales.add_child(bala)


func _on_Timer_timeout():
#	pot_disparar = true
	colpeja()
