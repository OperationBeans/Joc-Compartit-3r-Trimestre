extends Area2D

var velocitat :Vector2
func _process(delta):
	position += velocitat


func bala_malvada():
	set_collision_layer_bit(1, false)
	set_collision_layer_bit(2, true)
	set_collision_mask_bit(1, true)
	set_collision_mask_bit(2, false)
	
func _on_bala_militar_area_entered(area):
	if area.name == "Area2D" or area.name== "helicopter":
		pass
	else:
		queue_free()


func _on_bala_militar_body_entered(body):
	if body.name == "Personatge-era-militar":
		body.queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
