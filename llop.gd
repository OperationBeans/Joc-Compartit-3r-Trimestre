extends KinematicBody2D
var velocitat_base = 300
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocitat.x = 0
	velocitat += Vector2.LEFT * velocitat_base 
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)

func anima(velocitat: Vector2):
	var animacio : AnimatedSprite = $AnimatedSprite
	if (velocitat.x)>0:
		animacio.flip_h = true
		animacio.play("corre")
	if (velocitat.x)>0:
		animacio.flip_h = false
		animacio.play('corre')
	
