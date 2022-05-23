extends KinematicBody2D


var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var dead = false
var attacking = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if attacking == false and dead == false:
		var timer = Timer.new()
		timer.set_one_shot(true)
		timer.set_wait_time(5)
		timer.connect("timeout", self, "on_timeout")
		add_child(timer)
		timer.start()
	
	elif attacking == true and dead == false:
		var timer2 = Timer.new()
		timer2.set_one_shot(true)
		timer2.set_wait_time(5)
		timer2.connect("timeout", self, "on_timeout2")
		add_child(timer2)
		timer2.start()
	
	if attacking == false:
		velocitat_base = 250
		$Orc.flip_h = false
		$Orc.play("move")
		#$AttackArea/AttackCollision1.disabled = true
		#$AttackArea/AttackCollision2.disabled = true
	if attacking == true:
		velocitat_base = 350
		$Orc.flip_h = false
		$Orc.play("attack")
		#$AttackArea/AttackCollision1.disabled = false
		#$AttackArea/AttackCollision2.disabled = false
	
	velocitat.x = 0
	velocitat += Vector2.RIGHT * velocitat_base 
	velocitat += gravetat * delta
	#velocitat = move_and_slide(velocitat, Vector2.UP)
	
func on_timeout():
	attacking = true

func on_timeout2():
	attacking = false
