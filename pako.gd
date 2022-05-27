extends Area2D

var start = false
var start_2 = false

func _process(delta):
	if start == true:
		position.x -=2
	if start_2 == true:
		position.x +=2


func _on_limit_area_entered(area):
	area.queue_free()
	start = true


func _on_limpac_area_entered(area):
	if area.name == "pako":
		start = false
		$AnimatedSprite.play("New Anim")
		$Timer.start()
		$AnimatedSprite.flip_h = false
		


func _on_Timer_timeout():
	start_2 = true
	$AnimatedSprite.play("default")
