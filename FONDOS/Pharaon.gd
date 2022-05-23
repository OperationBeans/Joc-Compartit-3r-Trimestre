extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat_base = 325
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var dead = false
var attacking = false
var hits = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	if attacking == false and dead == false:
		var timer = Timer.new()
		timer.set_one_shot(true)
		timer.set_wait_time(5)
		timer.connect("timeout", self, "on_timeout")
		add_child(timer)
		timer.start()
	elif attacking == true and dead == false:
		var timer2 = Timer.new()
		timer2.set_one_shot(true)
		timer2.set_wait_time(5)
		timer2.connect("timeout", self, "on_timeout2")
		add_child(timer2)
		timer2.start()
	if (Global.pos.x)<position.x and dead == false:
		velocitat.x = 0
		velocitat += Vector2.RIGHT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		if attacking == false:
			velocitat_base = 250
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("move")
			$AttackArea/AttackCollision1.disabled = true
			$AttackArea/AttackCollision2.disabled = true
		if attacking == true:
			velocitat_base = 350
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play("attack")
			$AttackArea/AttackCollision1.disabled = false
			$AttackArea/AttackCollision2.disabled = false
	elif (Global.pos.x)>position.x and dead == false:
		velocitat.x = 0
		velocitat += Vector2.LEFT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		if attacking == false:
			velocitat_base = 250
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("move")
			$AttackArea/AttackCollision1.disabled = true
			$AttackArea/AttackCollision2.disabled = true
		if attacking == true:
			velocitat_base = 350
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play("attack")
			$AttackArea/AttackCollision1.disabled = false
			$AttackArea/AttackCollision2.disabled = false
	else:
		velocitat.x = 0
		$AnimatedSprite.play("default")

func on_timeout():
	attacking = true

func on_timeout2():
	attacking = false

func _on_AttackArea_body_entered(body):
	if hits == 1:
		dead = true
		$AnimatedSprite.play("dead")
	else:
		hits += 1

