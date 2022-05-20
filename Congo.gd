extends KinematicBody2D

var velocitat_base = 75
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var dead = false
var ataca = false
var dreta = false
var esquerra = false
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if esquerra == true and dead == false and ataca == true:
		velocitat.x = 0
		velocitat += Vector2.LEFT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$AreaCongo/AnimatedSprite.flip_h = true
		$AreaCongo/AnimatedSprite.play("move")
	elif dreta == true and dead == false and ataca == true:
		velocitat.x = 0
		velocitat += Vector2.RIGHT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$AreaCongo/AnimatedSprite.flip_h = false
		$AreaCongo/AnimatedSprite.play("move")
		


func _on_AttackArea_body_entered(body):
	dead = true
	$AreaCongo/AnimatedSprite.play("dead")

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
