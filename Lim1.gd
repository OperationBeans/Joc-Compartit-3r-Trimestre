extends Area2D





func _on_Lim1_body_entered(body):
	if body.name == "Cavaller enemic 2":
		body.vel = -1
