extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var timer_c = Timer.new()
	timer_c.set_one_shot(true)
	timer_c.set_wait_time(3)
	timer_c.connect("timeout", self, "on_timeout")
	add_child(timer_c)
	timer_c.start()
		
func on_timeout():
	get_tree().change_scene("res://Menú.tscn")
