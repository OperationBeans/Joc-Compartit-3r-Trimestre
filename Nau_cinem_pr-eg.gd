extends KinematicBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position.x += 5


func _on_AreaCastellNau_body_entered(body):
	if body.name == "Nau_cinem_pr-eg":
		queue_free()
