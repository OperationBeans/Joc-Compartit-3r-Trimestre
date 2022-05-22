extends CanvasLayer

export (NodePath) var player_node
onready var player = get_node(player_node)


func _process_(delta):
	print(player)
	print(player.vida)
	$TextureProgress.value = player.vida
