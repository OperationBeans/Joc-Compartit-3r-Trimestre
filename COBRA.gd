extends KinematicBody2D

var velocitat_base = 150
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var dead = false
var dreta = false
var esquerra = true

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if esquerra == true and dreta == false:
		velocitat.x = 0
		velocitat += Vector2.LEFT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$COBRA.flip_h = true
		$COBRA.play("move")
	elif dreta == true and esquerra == false:
		velocitat.x = 0
		velocitat += Vector2.RIGHT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$COBRA.flip_h = false
		$COBRA.play("move")


func _on_LimitDreta_body_entered(body):
	if body.name == "Cobra":
		esquerra = true
		dreta = false

func _on_LimitEsquerra_body_entered(body):
	if body.name == "Cobra":
		dreta = true
		esquerra = false
