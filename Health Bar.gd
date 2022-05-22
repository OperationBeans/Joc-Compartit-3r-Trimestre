extends Control

onready var health_bar = $HealthBar
onready var update_tween = $UpdateTween
func _on_health_update(health, amount):
	update_tween.interpolate_property(health_bar, "value", health_bar.value, health, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	update_tween.start()
	
func _on_max_health_update(max_health):
	health_bar.max_value = 100
