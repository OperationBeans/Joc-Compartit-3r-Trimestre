extends KinematicBody2D

var speed = 500
var velocity = Vector2()

func _physics_process(delta: float) -> void:
	var to_player = ($"../PacoFinalScene".position-position).normalized()
	velocity = to_player*speed
	move_and_collide(velocity*delta)
	
