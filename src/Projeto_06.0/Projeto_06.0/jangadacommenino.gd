extends KinematicBody2D

#Declaração de variáveis.
var velocidade = 350

#Função que processa constantemente quando o mapa carregado.
func _process(delta):
	var movimento = Vector2()
			
	#Aqui tem códigos de movimentação para a direita.
	if Input.is_action_pressed("ui_right"):
			movimento.x += velocidade 
	
	#Aqui tem código de movimentação para a esquerda.
	elif Input.is_action_pressed("ui_left"):
			movimento.x -= velocidade
	
	#Código do personagem parado.
	else:
		movimento.x = 0

	#Aqui tem a maneira como a movimentação irá se comportar.
	movimento = movimento.normalized()
	
	#Tipo de movimentação do personagem.
	move_and_slide(movimento * velocidade)
