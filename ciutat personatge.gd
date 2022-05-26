extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 350
var atac = false

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
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("move")


func _on_zonamort_body_entered(body):
	if body.name == "personatge ciutat":
		get_tree().change_scene("res://CIUTAT.tscn")
