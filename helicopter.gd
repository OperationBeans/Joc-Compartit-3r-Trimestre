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
	bala.rotation_degrees = 160
	bala.global_position = $Position2D.global_position
	bala.velocitat = 15 * Vector2.RIGHT.rotated(deg2rad(160))
	Global.Bales.add_child(bala)


func _on_Timer_timeout():
#	pot_disparar = true
	colpeja()
