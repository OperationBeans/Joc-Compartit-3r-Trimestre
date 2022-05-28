extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.RIGHT * 1500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocitat.x = 0
	velocitat += Vector2.RIGHT * velocitat_base 
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)


func _on_AreaCastellNau_body_entered(body):
	if body.name == "Nau_cinem_pr-eg":
		queue_free()
