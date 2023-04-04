extends Sprite
	
#Aqui é o movimento da nuvem. Quando chegar em certa posição ela irá retornar.
#Essa função sempre roda no mapa.
func _process(delta):
	position.x -= 0.5
	if position.x <= -11:
		position.x = 3308

