extends KinematicBody2D

var velocitat_base = 300
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 600

var dead = false
var is_attacking = false
var vida  = 100

func _physics_process(delta):
	velocitat.x=0
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
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	Global.pos = global_position

func _on_Area2D5_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://FONDOS/QUARTA PART EGIPTE.tscn") 


func _on_Area2D2_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://FONDOS/PRIMERA PART PARKOUR EGIPTE.tscn")


func _on_Area2D3_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://FONDOS/SEGONA PART EGIPTE.tscn")

func _on_Area2D6_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://FONDOS/escena final egipte.tscn")


func _on_PRIMERA_MORT_1_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://Escena Mort.tscn")


func _on_MORT_PART_2_1_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://Escena Mort.tscn")


func _on_MORT_PART_22_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://Escena Mort.tscn")


func _on_MORT_TERCERA_PART_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://Escena Mort.tscn")


func _on_MORT_QUARTA_PART_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://Escena Mort.tscn")


func _on_MORT_CINQUENA_PART_EGIPTE_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://Escena Mort.tscn")


func _on_Stalactites_body_entered(body):
	vida -= 50
	print(vida)


func _on_HOLAAA_body_entered(body):
	if body.name == "Paco":
		get_tree().change_scene("res://FONDOS/TERCERA PART EGIPTE.tscn")


func _on_AreaCobraAttack_body_entered(body):
	if body.name == "Paco":
		dead = true
		$AnimatedSprite.play("dead")
		get_tree().change_scene("res://Escena Mort.tscn")
