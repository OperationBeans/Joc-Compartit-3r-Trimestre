extends Area2D



func _on_AttackArea_body_entered(body):
	if body.name == "Cavaller enemic1":
		body.queue_free()
	if body.name == "Cavaller enemic 2":
		body.vida = body.vida - 25
	if body.name == "Cavaller enemic 3":
		body.vida = body.vida - 25
	
