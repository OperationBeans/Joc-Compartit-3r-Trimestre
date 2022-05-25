extends KinematicBody2D

var velocitat_base = 150
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var dead = false
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	Global.mort = dead
	if (Global.pos.x)>position.x and dead == false:
		velocitat.x = 0
		velocitat += Vector2.RIGHT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$AreaEnemy/AnimatedSprite.flip_h = true
		$AreaEnemy/AnimatedSprite.play("move")
	elif (Global.pos.x)<position.x and dead == false:
		velocitat.x = 0
		velocitat += Vector2.LEFT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$AreaEnemy/AnimatedSprite.flip_h = false
		$AreaEnemy/AnimatedSprite.play("move")
func _on_AttackArea_body_entered(body):
	if body.name == "Enemy":
		dead = true
		$AreaEnemy/AnimatedSprite.play("dead")
		var timer = Timer.new()
		timer.set_one_shot(true)
		timer.set_wait_time(1)
		timer.connect("timeout", self, "on_timeout")
		add_child(timer)
		timer.start()
		
func on_timeout():
	Global.mort = true ###ARREGLAR LO DE GLOBAAAAAAL
	print(Global.mort)
	hide()
	queue_free()
