extends KinematicBody2D
var velocidade = 350

func _process(delta):
	var movimento = Vector2()
			
	#Aqui tem códigos de movimentação para a direita.
	#Também o controle de qual Sprite aparece e qual desaparece quando clicar para a DIREITA.
	if Input.is_action_pressed("ui_right"):
			movimento.x += velocidade 
	
	#Aqui tem código de movimentação para a esquerda.
	#Aqui tem o controle de qual Sprite aparece e qual desaparece quando clicar para a ESQUERDA.
	elif Input.is_action_pressed("ui_left"):
			movimento.x -= velocidade
		
	else:
		movimento.x = 0
	
	#Aqui tem o código do personagem parado.
	#Mais uma vez, o controle das Sprites quando parado.
		
	#Aqui tem a maneira como a movimentação irá se comportar.
	movimento = movimento.normalized()
	
	#Tipo de movimentação do personagem.
	move_and_slide(movimento * velocidade)
