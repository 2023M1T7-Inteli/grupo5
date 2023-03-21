extends KinematicBody2D

#Nomeação das variaveis do personagem e interações
#var item: bool = false
var velocidade = 350
onready var andaJogador = $AnimationPlayer
onready var andaJogador2 = $AnimationPlayer2

#Devido à alguns erros na montagem das Sprites, fizemos uma duplicação do personagem para que se tornasse um objeto só sem apresentar erros de movimentação.
#Aqui a Sprite 2 começa invísivel
func _ready():
	$Sprite2.visible = false


#Essa função faz o processo sempre rodar nas cenas.
func _physics_process(delta):
	
	
	
	var movimento = Vector2()
	
	movimento.y += 1
		
	#Aqui tem códigos de movimentação para a direita.
	#Também o controle de qual Sprite aparece e qual desaparece quando clicar para a DIREITA.
	if Input.is_action_pressed("ui_right"):
		$Sprite.visible = false
		$Sprite2.visible = true
		movimento.y += 2
		movimento.x += velocidade 
		andaJogador2.play("andandodireitaa")
	
	#Aqui tem código de movimentação para a esquerda.
	#Aqui tem o controle de qual Sprite aparece e qual desaparece quando clicar para a ESQUERDA.
	elif Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = false
		$Sprite.visible = true
		$Sprite2.visible = false
		movimento.y += 2
		movimento.x -= velocidade
		andaJogador.play("andandoEsquerda")
		
	else:
		$Sprite2.visible = false
		$Sprite.visible = true
		movimento.x = 0
		andaJogador.play("respirando")
	
	#Aqui tem o código do personagem parado.
	#Mais uma vez, o controle das Sprites quando parado.
		
	#Aqui tem a maneira como a movimentação irá se comportar.
	movimento = movimento.normalized()
	
	#Tipo de movimentação do personagem.
	move_and_slide(movimento * velocidade)





