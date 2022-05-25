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
		$TextureProgress.value -= 1000
		dead = true
		
func _on_Portal_body_entered(body):
	if body.name == "MainCharacter":
		get_tree().change_scene("res://FONDOS/PRIMERA PART PARKOUR EGIPTE.tscn")

func _on_Stalactites_body_entered(body):
	if body.name == "MainCharacter":
		$TextureProgress.value -= 50
	
func _on_AreaCongo_body_entered(body):
	if body.name == "MainCharacter":
		$TextureProgress.value -= 1000
		dead = true
		
func on_timeout_mort():
	get_tree().change_scene("res://Escena Mort.tscn")

func _on_AreaMeat_body_entered(body):
	if body.name == "MainCharacter":
		$TextureProgress.value += 30

func _on_Campfire_body_entered(body):
	if body.name == "MainCharacter":
		$TextureProgress.value -= 20
