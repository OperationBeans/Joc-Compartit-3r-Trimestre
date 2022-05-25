extends KinematicBody2D

var velocitat_base = 150
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var dead = false
var dreta = true
var esquerra = false

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if is_on_floor() == true and dreta == true:
		velocitat.x = 0
		velocitat += Vector2.RIGHT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$COBRA.flip_h = true
		$COBRA.play("move")
	elif (Global.pos.x)<position.x and dead == false:
		velocitat.x = 0
		velocitat += Vector2.LEFT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$COBRA.flip_h = false
		$COBRA.play("move")
