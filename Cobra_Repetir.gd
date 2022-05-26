extends KinematicBody2D

var velocitat_base = 150
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980
var dead = false
var on = true
var off = false

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if on == true and off == false:
		var timer_o = Timer.new()
		timer_o.set_one_shot(true)
		timer_o.set_wait_time(1)
		timer_o.connect("timeout", self, "on_timeout_off")
		add_child(timer_o)
		timer_o.start()
		velocitat.x = 0
		print("hola")
		velocitat += Vector2.LEFT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$COBRA.flip_h = true
		$COBRA.play("move")
	elif off == true and on == false:
		velocitat.x = 0
		velocitat += Vector2.RIGHT * velocitat_base 
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		$COBRA.flip_h = false
		$COBRA.play("move")
		var timer = Timer.new()
		timer.set_one_shot(true)
		timer.set_wait_time(1)
		timer.connect("timeout", self, "on_timeout_on")
		add_child(timer)
		timer.start()
		
func on_timeout_on():
	on = true
	off = false

func on_timeout_off():
	off = true
	on = false
