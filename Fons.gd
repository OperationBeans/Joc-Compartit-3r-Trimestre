extends TextureRect

var imatge1 = preload("res://fondo egipte.jpg")
var imatge2 = preload("res://.import/screenshot_example_03-original.webp-508f72488814718f8ca0bc26b6401f35.stex")
var imatge3 = preload("res://Fondo nivell 1 .jpg.tres")
func _on_Area2D_body_entered(body):
	texture = imatge1


func _on_Canvi_2_body_entered(body):
	texture = imatge2


func _on_Canvi_3_body_entered(body):
	texture = imatge3
	
