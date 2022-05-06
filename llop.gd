extends KinematicBody2D
var velocitat_base = 100
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var ataca = false

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if ataca:
		if Global.pos.x >position.x:
			velocitat.x = 0
			velocitat += Vector2.RIGHT * velocitat_base 
			velocitat += gravetat * delta
			velocitat = move_and_slide(velocitat, Vector2.UP)
			anima(velocitat)
		elif Global.pos.x<position.x:
			velocitat.x = 0
			velocitat += Vector2.LEFT * velocitat_base 
			velocitat += gravetat * delta
			velocitat = move_and_slide(velocitat, Vector2.UP)
			anima(velocitat)

func anima(velocitat: Vector2):
	var animacio : AnimatedSprite = $llop
	if (velocitat.x)>0:
		animacio.flip_h = false
		animacio.play("corre")
	if (velocitat.x)<0:
		animacio.flip_h = true
		animacio.play("corre")
	if velocitat_base == 0:
		animacio.play("quiet")
	
func _on_area_atac_llop_body_entered(body):
	ataca = true
