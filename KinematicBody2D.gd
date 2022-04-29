extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 400

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

func anima(velocitat: Vector2):
	var animacio : AnimatedSprite = $AnimatedSprite
	if Input.is_action_just_pressed('click_esq') and is_on_floor():
		animacio.play('pegar')
		$Collision_Paco.scale = Vector2(2,1)
		
	if velocitat.x > 0:
		animacio.flip_h = false
		animacio.play('camina')
		$Collision_Paco.scale = Vector2(1,1)

	elif velocitat.x < 0:
		animacio.flip_h = true
		animacio.play('camina')
		$Collision_Paco.scale = Vector2(1,1)

	if velocitat.y < -1:
		animacio.play('salta')
		$Collision_Paco.scale = Vector2(1,1)
	
		
