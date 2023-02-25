extends Sprite
	
#Aqui é o movimento da nuvem. Quando chegar em certa posição ela irá retornar.
func _process(delta):
	position.x -= 0.5
	if position.x <= 565:
		position.x = 3308

