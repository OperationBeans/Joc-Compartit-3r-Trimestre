extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var nau_aterrat = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	if nau_aterrat == true:
		position.x = 200
	else:
		position.x = 10000000

func _on_Nau_Terra_body_entered(body):
	nau_aterrat = true
