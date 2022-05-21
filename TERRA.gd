extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 341.75
	print(Global.mort)
	if Global.mort == true:
		position.x = 338.25

