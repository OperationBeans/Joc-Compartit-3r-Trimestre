extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN*980
var salt = Vector2.UP*500

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("W") and is_on_floor():
		velocitat += salt
	if Input.is_action_pressed('D'):
		velocitat += Vector2.RIGHT*velocitat_base
	if Input.is_action_pressed('E'):
		velocitat += Vector2.LEFT*velocitat_base
	if Input.is_action_pressed("S") and is_on_ceiling():
		velocitat += Vector2.DOWN
	
	velocitat += gravetat*delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)

func anima(velocitat:Vector2):
	var animacio : AnimatedSprite = $AnimatedSprite
	if velocitat.x>0:
		animacio.flip_h = false
		animacio.play("camina")
	elif velocitat.x<0:
		animacio.flip_h = true
		animacio.play("camina")
	if velocitat.y<-1:
		animacio.play("salta")
	if abs(velocitat.x)<0.1:
		animacio.play("quiet")
