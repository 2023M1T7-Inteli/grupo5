extends KinematicBody2D

#Nomeação das variaveis do personagem
var item: bool = false
var movimento = Vector2.ZERO
var pulo = Input.is_action_just_pressed ("ui_up")
var pararPulo = Input.is_action_just_released("ui_up")
var forcPulo


#Essa função faz o processo sempre rodar nas cenas.
func _physics_process(delta):
	#Aqui tem códigos de gravidade.
	movimento.y = movimento.y + 20
	pulo = -500
	
	#Aqui tem códigos de movimentação para a direita.
	if Input.is_action_pressed("ui_right"):
		movimento.x = 500
		
	#Aqui tem código de movimentação para a esquerda.
	elif Input.is_action_pressed("ui_left"):
		movimento.x = -500
	
	#Aqui tem código do personagem parado.
	else:
		movimento.x = 0
	
	#Movimentação
	move_and_slide(movimento)
	
	#Personagem pular
	if Input.is_action_just_pressed ("ui_up"):
		movimento.y = -500
	elif is_on_floor():
		if pulo:
			movimento.y = pulo
	elif pararPulo and movimento.y < 0:
		movimento.y = 0
	
	#Personagem parado
	else:
		movimento.x = 0
		
	move_and_slide(movimento)
	
	
