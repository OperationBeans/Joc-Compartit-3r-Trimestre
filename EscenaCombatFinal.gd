extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var escena_label = load("res://AVIS COMBAT FINAL.tscn")
	var escena = escena_label.instance()
	add_child(escena)
