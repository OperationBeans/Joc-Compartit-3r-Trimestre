extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 500
var atac = false

func _physics_process(delta):
	velocitat.x = 0

	if Input.is_action_pressed("D"):
		velocitat += Vector2.RIGHT * velocitat_base

	if Input.is_action_pressed("A"):
		velocitat += Vector2.LEFT * velocitat_base  

	if Input.is_action_just_pressed("W") and is_on_floor():
		velocitat += salt  
	if Input.is_action_just_pressed("click_esq"):
		colpeja()
	
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	#anima(velocitat)

#func anima(velocitat: Vector2):
#	var animacio : AnimatedSprite = $AnimatedSprite
#	if atac:
#		$AnimatedSprite.play("pegale")
#	else:
#		if velocitat.x > 0:
#			animacio.flip_h = false
#			animacio.play('camina')
#
#		elif velocitat.x < 0:
#			animacio.flip_h = true
#			animacio.play('camina')
#		elif abs(velocitat.x) == 0:
#			animacio.play('parat')
#		if velocitat.y < -1:
#			animacio.play('salta')
#
#
#
func colpeja():
	var escena = load("res://bala militar.tscn")
	var bala = escena.instance()
	bala.global_position = global_position
	Global.Bales.add_child(bala)



#func _on_AnimatedSprite_animation_finished():
#	if $AnimatedSprite.animation == 'pegale':
#		atac = false
