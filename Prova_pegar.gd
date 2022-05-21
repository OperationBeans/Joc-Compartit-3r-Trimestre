extends KinematicBody2D

var velocitat_base = 300
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 600
var already_ate = false
var vida = 100
var dead = false
var is_attacking = false

func _physics_process(delta):
	velocitat.x=0
	if Input.is_action_just_pressed("W") and is_on_floor() and is_attacking == false and dead == false:
		velocitat += salt 
	elif Input.is_action_pressed("D") and is_attacking == false and dead == false:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('move')
		velocitat += Vector2.RIGHT * velocitat_base  
	elif Input.is_action_pressed("A") and is_attacking == false and dead == false:
		velocitat += Vector2.LEFT * velocitat_base  
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play('move')
	else:
		velocitat.x = 0
		if is_attacking == false and dead == false:
			$AnimatedSprite.play("default")
	if Input.is_action_just_pressed("attack") and dead == false:
		$AnimatedSprite.play("attack")
		is_attacking = true
		$AttackArea/CollisionShape2D.disabled = false
		$AttackArea2/CollisionShape2D.disabled = false
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	Global.pos = global_position

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack":
		$AttackArea/CollisionShape2D.disabled = true
		$AttackArea2/CollisionShape2D.disabled = true
		is_attacking = false

func _on_AreaEnemy_body_entered(body):
	if body.name == "MainCharacter":
		dead = true
		$AnimatedSprite.play("dead")

func _on_Area2D_body_entered(body):
	vida -= 20
	print(vida)

func _on_AreaMeat_body_entered(body):
	if body.name == "MainCharacter" and already_ate == false:
		already_ate = true
		vida += 20
		print(vida)
	else:
		pass

func _on_Stalactites_body_entered(body):
	if body.name=="MainCharacter":
		vida -= 50
		print(vida)

func _on_AreaCongo_body_entered(body):
	if body.name == "MainCharacter":
		dead = true
		$AnimatedSprite.play("dead")


func _on_Portal_body_entered(body):
	get_tree().change_scene("res://FONDOS/PARKOUR.tscn")