extends KinematicBody2D

var mort = false
var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 500

func _physics_process(delta):
	velocitat.x = 0

	if Input.is_action_pressed("D"):
		velocitat += Vector2.RIGHT * velocitat_base

	if Input.is_action_pressed("A"):
		velocitat += Vector2.LEFT * velocitat_base  

	if Input.is_action_just_pressed("W") and is_on_floor():
		velocitat += salt  

	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)
#	Global.pos = global_position

func anima(velocitat: Vector2):
	var animacio : AnimatedSprite = $AnimatedSprite
	if Input.is_action_just_pressed("click_esq")and is_on_floor() and mort==false:
		animacio.play("pegale")
		$AreaAtac.set_deferred("disabled", false)
		print("Desabeled")
		
	if velocitat.x > 0 and mort==false:
		animacio.flip_h = false
		animacio.play('camina')

	elif velocitat.x < 0 and mort==false:
		animacio.flip_h = true
		animacio.play('camina')

	if velocitat.y < -1  and mort==false:
		animacio.play('salta')
	
	
	if mort == true:
		animacio.play("mort")
		mort = true
	
	if animacio.frame==7:
		print("hi")
		$AreaAtac.set_deferred("disabled", true)

func _on_Area2D2_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://FONDOS/PRIMERA PART PARKOUR EGIPTE.tscn")


func _on_Area2D3_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://FONDOS/SEGONA PART EGIPTE.tscn")


func _on_Area2D4_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://FONDOS/TERCERA PART EGIPTE.tscn")


func _on_Area2D5_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://FONDOS/escena final egipte.tscn")


func _on_Area2D_body_entered(body):
	if body.name == "Paco":
		mort = true
	else:
		pass


