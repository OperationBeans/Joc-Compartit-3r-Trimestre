extends KinematicBody2D

var velocitat_base = 150
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var dead = false
var ataca = false

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if (Global.pos.x)>position.x and dead == false and ataca == true:
		velocitat.x = 0
		velocitat += Vector2.RIGHT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$AreaCongo/AnimatedSprite.flip_h = false
		$AreaCongo/AnimatedSprite.play("move")
	elif (Global.pos.x)<position.x and dead == false and ataca == true:
		velocitat.x = 0
		velocitat += Vector2.LEFT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$AreaCongo/AnimatedSprite.flip_h = true
		$AreaCongo/AnimatedSprite.play("move")
		
func _on_Area2D2_body_entered(body):
	if body.name == "MainCharacter":
		ataca = true
	else:
		velocitat.x = 0 
		ataca = false
		$AreaCongo/AnimatedSprite.play("default")


func _on_AttackArea_body_entered(body):
	dead = true
	$AreaCongo/AnimatedSprite.play("dead")
