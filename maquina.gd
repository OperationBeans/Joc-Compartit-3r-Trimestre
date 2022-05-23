extends Area2D

var start = false

func _ready():
	$Timer.start()
func _process(_delta):
	if start == true:
		position.y -= 5

func _on_Timer_timeout():
	start = true
	print("changed")


func _on_maquina_area_entered(area):
	if area.name == "limit":
		queue_free()
