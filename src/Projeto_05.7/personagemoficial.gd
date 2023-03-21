extends KinematicBody2D

#Nomeação das variaveis do personagem e interações
#var item: bool = false
var velocidade = 350
onready var andaJogador = $AnimatedSprite
var lado = 0

#Essa função faz o processo sempre rodar nas cenas.
func _physics_process(delta):
	var movimento = Vector2()
	
	movimento.y += 1
		
	#Aqui tem códigos de movimentação para a direita.
	#Também o controle de qual Sprite aparece e qual desaparece quando clicar para a DIREITA.
	if Input.is_action_pressed("ui_right"):
		movimento.y += 2
		movimento.x += velocidade 
		andaJogador.play("andando")
		lado = 0
	
	#Aqui tem código de movimentação para a esquerda.
	#Aqui tem o controle de qual Sprite aparece e qual desaparece quando clicar para a ESQUERDA.
	elif Input.is_action_pressed("ui_left"):
		movimento.y += 2
		movimento.x -= velocidade
		andaJogador.play("andandoesquerda")
		lado = 1
		
	else:
		if lado == 0:
			andaJogador.play("paradoesquerda")
			movimento.x = 0
		elif lado == 1:
			movimento.x = 0
			andaJogador.play("paradodireita")
	
	#Aqui tem o código do personagem parado.
	#Mais uma vez, o controle das Sprites quando parado.
		
	#Aqui tem a maneira como a movimentação irá se comportar.
	movimento = movimento.normalized()
	
	#Tipo de movimentação do personagem.
	move_and_slide(movimento * velocidade)


