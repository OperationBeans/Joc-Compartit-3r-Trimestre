extends KinematicBody2D
var vel = 1
var ant_vel = 0
var vida = 100
func _ready():
	$Atac.start()
	$AnimatedSprite.play("move")
func _process(delta):
	if vel <1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
		
	if vida == 0:
		queue_free()
	else:
		position.x += vel
	
func _on_Atac_timeout():
	ant_vel = vel
	vel = 0
	$AnimatedSprite.play("attack")
	if vel<1:
		$"Atac Left/CollisionShape2D2".set_deferred("disabled", false)
	else:
		$"Atac Right/CollisionShape2D".set_deferred("disabled", false)

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack":
		if vel<1:
			$"Atac Left/CollisionShape2D2".set_deferred("disabled", true)
		else:
			$"Atac Right/CollisionShape2D".set_deferred("disabled", true)
		vel = ant_vel
		$AnimatedSprite.play("move")
		print(vel)


