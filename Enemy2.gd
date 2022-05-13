extends KinematicBody2D

var velocitat_base = 150
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var dead = false

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if (Global.pos.x-70)>position.x and dead == false:
		velocitat.x = 0
		velocitat += Vector2.RIGHT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$AreaEnemy/AnimatedSprite.flip_h = true
		$AreaEnemy/AnimatedSprite.play("move")
	elif (Global.pos.x+70)<position.x and dead == false:
		velocitat.x = 0
		velocitat += Vector2.LEFT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$AreaEnemy/AnimatedSprite.flip_h = false
		$AreaEnemy/AnimatedSprite.play("move")

func _on_AttackArea_body_entered(body):
	dead = true
	$AreaEnemy/AnimatedSprite.play("dead")
