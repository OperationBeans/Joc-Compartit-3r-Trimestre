extends KinematicBody2D

var velocitat_base = 75
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var dead = false
var ataca = false
var dreta = false
var esquerra = false
var ghost = false
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if ghost == true:
		velocitat_base = 200
	if esquerra == true and dead == false and ataca == true:
		velocitat.x = 0
		velocitat += Vector2.LEFT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$AreaCongo/AnimatedSprite.flip_h = true
		if ghost == false:
			$AreaCongo/AnimatedSprite.play("move")
		elif ghost == true:
			$AreaCongo/AnimatedSprite.play("move_ghost")
	elif dreta == true and dead == false and ataca == true:
		velocitat.x = 0
		velocitat += Vector2.RIGHT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$AreaCongo/AnimatedSprite.flip_h = false
		if ghost == false:
			$AreaCongo/AnimatedSprite.play("move")
		elif ghost == true:
			$AreaCongo/AnimatedSprite.play("move_ghost")

func _on_AttackArea_body_entered(body):
	if body.name == "Congo" and ghost == false:
		dead = true
		esquerra = false
		dreta = false
		velocitat.x = 0
		$AreaCongo/AnimatedSprite.play("dead")
		var timer = Timer.new()
		timer.set_one_shot(true)
		timer.set_wait_time(1)
		timer.connect("timeout", self, "on_timeout")
		add_child(timer)
		timer.start()
	elif body.name == "Congo" and ghost == true:
		dead = true
		esquerra = false
		dreta = false
		velocitat.x = 0
		$AreaCongo/AnimatedSprite.play("dead_ghost")
		yield(get_tree().create_timer(1), "timeout")
		hide()
		queue_free()

func on_timeout():
	dead = false
	ghost = true


func _on_LimitsCongoDreta_body_entered(body):
	esquerra = true
	dreta = false

func _on_LimitsCongoEsquerra_body_entered(body):
	dreta = true
	esquerra = false

func _on_AreaAlertaCongo_body_entered(body):
	if body.name == "MainCharacter":
		ataca = true
		esquerra = true
	else: 
		ataca = false
