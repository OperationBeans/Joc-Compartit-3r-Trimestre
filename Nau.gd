extends KinematicBody2D

var velocitat_base = 50
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 150
var despegar = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if despegar == false:
		velocitat.x = 0
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
	if despegar == true:
		var gravetat = Vector2.UP * 150
		velocitat.x = 0
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat, Vector2.UP)
		var timer = Timer.new()
		timer.set_one_shot(true)
		timer.set_wait_time(3)
		timer.connect("timeout", self, "on_timeout")
		add_child(timer)
		timer.start()
		
func on_timeout():
	get_tree().change_scene("res://congrats.tscn")

func _on_Area2D_body_entered(body):
	if body.name == "KinematicBody2D":
		despegar = true
