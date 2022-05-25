extends KinematicBody2D

var velocitat_base = 300
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 600
var already_ate = false
var dead = false
var is_attacking = false
var value = 200



func _physics_process(delta):
	velocitat.x=0
#	if $TextureProgress.value <= 0:
#		dead = true
	if dead == true:
		queue_free()
	if Input.is_action_just_pressed("W") and is_on_floor() and is_attacking == false and dead == false:
		velocitat += salt 
		
	elif Input.is_action_pressed("D") and is_attacking == false and dead == false:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('Camina')
		velocitat += Vector2.RIGHT * velocitat_base  
	elif Input.is_action_pressed("A") and is_attacking == false and dead == false:
		velocitat += Vector2.LEFT * velocitat_base  
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play('Camina')
	else:
		velocitat.x = 0
		if is_attacking == false and dead == false:
			$AnimatedSprite.play("Quiet")
	if Input.is_action_just_pressed("attack") and dead == false:
		$AnimatedSprite.play("Pega")
		is_attacking = true
		$AttackArea/CollisionShape2D.disabled = false
		$AttackArea2/CollisionShape2D.disabled = false
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	Global.pos = global_position

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Pega":
		$AttackArea/CollisionShape2D.disabled = true
		$AttackArea2/CollisionShape2D.disabled = true
		is_attacking = false

