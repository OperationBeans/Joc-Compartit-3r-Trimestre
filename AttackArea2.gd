extends Area2D


# Declare member variables here. Exampl

func _on_AttackArea2_body_entered(body):
	if body.name == "Cavaller enemic1":
		body.queue_free()
	if body.name == "Cavaller enemic 2":
		body.vida = body.vida - 25
	if body.name == "Cavaller enemic 3":
		body.vida = body.vida - 25
