extends Area2D



func _on_Limit_dreta_body_entered(body):

	if body.name == "Cavaller_enemic1":
		body.vel = 1
