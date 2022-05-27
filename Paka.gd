extends KinematicBody2D

var velocitat_base = 200
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 1000
var nau_aterrat = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	if nau_aterrat == true:
		position.x = -40
	else:
		position.x = 10000000

func _on_Nau_Terra_body_entered(body):
	nau_aterrat = true


func _on_AreaPaca_body_entered(body):
	if body.name == "KinematicBody2D":
		var escena_dialeg = load("res://dialeg_paca.tscn")
		var escena = escena_dialeg.instance()
		add_child(escena)
		var timer = Timer.new()
		timer.set_one_shot(true)
		timer.set_wait_time(4)
		timer.connect("timeout", self, "on_timeout")
		add_child(timer)
		timer.start()
		
func on_timeout():
	hide()
	queue_free()
