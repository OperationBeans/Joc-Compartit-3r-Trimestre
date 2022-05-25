extends KinematicBody2D


var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 1000
var dead = false
var attacking = false
var is_attacking = false
var start = false
var vida = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var to_player = ($"../../PacoFinalScene".position-position).normalized()
	
	if $TextureProgress.value <= 0:
		dead = true
	if dead == true:
		$Orc.play("dying")
	
	if start == false:
		var start_timer = Timer.new()
		start_timer.set_one_shot(true)
		start_timer.set_wait_time(3)
		start_timer.connect("timeout", self, "on_timeout_start")
		add_child(start_timer)
		start_timer.start()
	
	if attacking == false and dead == false and start == true:
		var timer = Timer.new()
		timer.set_one_shot(true)
		timer.set_wait_time(3)
		timer.connect("timeout", self, "on_timeout")
		add_child(timer)
		timer.start()
	
	elif attacking == true and dead == false and start == true:
		var timer2 = Timer.new()
		timer2.set_one_shot(true)
		timer2.set_wait_time(5)
		timer2.connect("timeout", self, "on_timeout2")
		add_child(timer2)
		timer2.start()
	
	if to_player.x<0 and dead == false:
		if attacking == false and start == true:
			velocitat_base = 300
			velocitat = to_player*velocitat_base
			$Orc.flip_h = true
			$Orc.play("default")
			move_and_collide(velocitat*delta)
			#$AttackArea/AttackCollision1.disabled = true
			#$AttackArea/AttackCollision2.disabled = true
		if attacking == true and start == true:
			velocitat_base = 300
			velocitat = to_player*velocitat_base
			$Orc.flip_h = true
			$Orc.play("attack")
			move_and_collide(velocitat*delta)
			$AreaBat/CollisionShape2D.disabled = false
		#$AttackArea/AttackCollision1.disabled = false
		#$AttackArea/AttackCollision2.disabled = false
	if to_player.x>0 and dead == false:
		if attacking == false and start == true:
			velocitat_base = 200
			velocitat = to_player*velocitat_base
			$Orc.flip_h = false
			$Orc.play("default")
			move_and_collide(velocitat*delta)
		if attacking == true and start == true:
			velocitat_base = 200
			velocitat = to_player*velocitat_base
			$Orc.flip_h = false
			$Orc.play("attack")
			move_and_collide(velocitat*delta)
			$AreaBat/CollisionShape2D2.disabled = false

func on_timeout():
	attacking = true

func on_timeout2():
	attacking = false

func on_timeout_start():
	start = true

func _on_Orc_animation_finished():
	if $Orc.animation == "attack":
		$AreaBat/CollisionShape2D.disabled = true
		$AreaBat/CollisionShape2D2.disabled = true
		is_attacking = false


func _on_AttackingArea_body_entered(body):
	if body.name == "Orc":
		$TextureProgress.value -= 10
