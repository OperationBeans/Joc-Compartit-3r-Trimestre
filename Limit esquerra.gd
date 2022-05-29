extends Area2D



func _on_Limit_esquerra_body_entered(body):
	if body.name == "Cavaller enemic1":
		body.vel = -1
