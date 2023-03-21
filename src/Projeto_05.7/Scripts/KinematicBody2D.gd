extends KinematicBody2D

#Nomeação das variaveis do personagem
var item: bool = false
var movimento = Vector2.ZERO

#Essa função faz o processo sempre rodar nas cenas.
func _physics_process(delta):
	#gravidade-sotto
	movimento.y = movimento.y + 20
	
	#movimentação para a direita.
	if Input.is_action_pressed("ui_right"):
		movimento.x = 500
		
	#movimentação para a esquerda.
	elif Input.is_action_pressed("ui_left"):
		movimento.x = -500
	
	#personagem parado.
	else:
		movimento.x = 0
	
	#Movimentação
	move_and_slide(movimento)
	
	
	
