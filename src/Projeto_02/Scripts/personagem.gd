extends KinematicBody2D

#Nomeação das variaveis do personagem e interações
var item: bool = false
var velocidade = 350
onready var andaJogador = $AnimationPlayer


#Essa função faz o processo sempre rodar nas cenas.
func _physics_process(delta):
	var movimento = Vector2()
	#Aqui tem códigos de movimentação para a direita.
	if Input.is_action_pressed("ui_right"):
		movimento.x += velocidade 
		andaJogador.play("andandodireta")
	
	#Aqui tem código de movimentação para a esquerda.
	elif Input.is_action_pressed("ui_left"):
		movimento.x -= velocidade
		andaJogador.play("andandoEsquerda")
	
	#Aqui tem o código do personagem parado.
	else:
		movimento.x = 0
		andaJogador.play("respirando")
		
	# Comentar
	movimento = movimento.normalized()
	
	#Tipo de movimentação do personagem.
	move_and_slide(movimento * velocidade)
	pass

