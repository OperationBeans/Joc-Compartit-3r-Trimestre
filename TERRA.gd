extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 20000000
	print(Global.mort)
	if Global.mort == true:
		position.x = 338.25

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
