extends Sprite
#Declaração de variáveis.
var velocidade = 15
var tempo = 1


#Função que processa constantemente quando o mapa carregado.
func _process(delta):
	if tempo == 1:
		while tempo == 1:
			move_local_y(velocidade * delta)
			yield(get_tree().create_timer(1), "timeout")
			tempo = 0
			
	elif tempo == 0:
		while tempo == 0:
			move_local_y(-velocidade * delta)
			yield(get_tree().create_timer(1), "timeout")
			tempo = 1
