extends Sprite
	
func _process(delta):
	position.x -= 0.5
	if position.x <= 565:
		position.x = 3308




func _on_pausar_pressed():
	pass # Replace with function body.
