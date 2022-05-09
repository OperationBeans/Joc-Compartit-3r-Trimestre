extends Area2D


func _ready():
	$Timer.start()

func _process(delta):
	position.y +=4
func _on_Timer_timeout():
	queue_free()


func _on_Node2D_area_entered(area):
	if area.name != "terra":
		area.queue_free()
	queue_free()
