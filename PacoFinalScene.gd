extends KinematicBody2D

var velocitat_base = 300
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 500
var salt = Vector2.UP * 600
var already_ate = false
var dead = false
var is_attacking = false
var value = 200
var able_to_attack = false



func _physics_process(delta):
	var timer_inici = Timer.new()
	timer_inici.set_one_shot(true)
	timer_inici.set_wait_time(3)
	timer_inici.connect("timeout", self, "on_timeout_inici")
	add_child(timer_inici)
	timer_inici.start()
	velocitat.x=0
	if $TextureProgress.value <= 0:
		dead = true
	if dead == true:
		$AnimatedSprite.play("dead")
		var timer = Timer.new()
		timer.set_one_shot(true)
		timer.set_wait_time(1)
		timer.connect("timeout", self, "on_timeout_mort")
		add_child(timer)
		timer.start()
	if Input.is_action_just_pressed("W") and is_on_floor() and is_attacking == false and dead == false:
		velocitat += salt 
	elif Input.is_action_pressed("D") and is_attacking == false and dead == false:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play('move')
		velocitat += Vector2.RIGHT * velocitat_base  
	elif Input.is_action_pressed("A") and is_attacking == false and dead == false:
		velocitat += Vector2.LEFT * velocitat_base  
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('move')
	elif Input.is_action_pressed("S") and is_attacking == false and dead == false and is_on_floor() == false:
		velocitat += Vector2.DOWN * 100  
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('move')
	else:
		velocitat.x = 0
		if is_attacking == false and dead == false:
			$AnimatedSprite.play("default")
	if Input.is_action_just_pressed("attack") and dead == false and able_to_attack == true:
		$AnimatedSprite.play("attack")
		is_attacking = true
		$AttackingArea/CollisionShape2D.disabled = false
		$AttackingArea/CollisionShape2D2.disabled = false
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	Global.pos = global_position
	
func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack":
		$AttackingArea/CollisionShape2D.disabled = true
		$AttackingArea/CollisionShape2D2.disabled = true
		is_attacking = false
		
func on_timeout_mort():
	get_tree().change_scene("res://Escena Mort.tscn")


func _on_AreaBat_body_entered(body):
	if body.name == "PacoFinalScene":
		$TextureProgress.value -= 20


func _on_AreaOrc_body_entered(body):
	if body.name == "PacoFinalScene":
		$TextureProgress.value -= 100

func on_timeout_inici():
	able_to_attack = true
