extends Area2D



func _on_lime_body_entered(body):
	if body.name == "Cavaller enemic 3":
		body.vel = 1
