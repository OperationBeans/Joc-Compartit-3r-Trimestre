extends KinematicBody2D

var vida = 100
var mort = false
var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 500

func _physics_process(delta):
	velocitat.x = 0
	
	if Input.is_action_pressed("D"):
		velocitat += Vector2.RIGHT * velocitat_base

	if Input.is_action_pressed("A"):
		velocitat += Vector2.LEFT * velocitat_base  

	if Input.is_action_just_pressed("W") and is_on_floor():
		velocitat += salt  

	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)
	Global.pos = global_position

func anima(velocitat: Vector2):
	var animacio : AnimatedSprite = $AnimatedSprite
	if Input.is_action_just_pressed("click_esq")and is_on_floor():
		animacio.play("pegar")
	if velocitat.x > 0:
		animacio.flip_h = false
		animacio.play('camina')

	elif velocitat.x < 0:
		animacio.flip_h = true
		animacio.play('camina')

	if velocitat.y < -1:
		animacio.play('salta')
	
	if Input.is_action_just_pressed("click_esq"):
		animacio.play("pegar")
	
	if mort == true and velocitat.x > 0:
		animacio.flip_h = false
		animacio.play("mort")
	if mort == true and velocitat.x < 0:
		animacio.flip_h = true
		animacio.play("mort")
func _on_Area2D_body_entered(body):
	if body.name=="Paco":
		vida -= 100
		mort = true
