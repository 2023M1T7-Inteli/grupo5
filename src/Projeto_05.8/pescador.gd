extends KinematicBody2D
var comandos = []
var graus = 90
var anguloRad = deg2rad(graus)
var rotaDireita = load("res://botões/botão_voltar.png")
var rotaEsquerda = load("res://console/setaAntiHorario.png")
var reto = load ("res://console/seta_grande1-removebg-preview (1).png")
var pescador = load("res://Imagens/jangada_lado.png")
var speed = 250
var rotation_speed = 1.5
var move = Vector2(0,0)
var rotation_dir = 0
var x = 0
var y = 0
var andando = false
var j = 0
func _on_touchDireita_pressed(): #adiciona os comandos no console
	j += 1
	while j <= 10:
		if j == 1:
			
			$"../espaco1".texture = rotaDireita
		
		if j == 2:
			
			$"../espaco2".texture = rotaDireita
		
		if j == 3:
		
			$"../espaco3".texture = rotaDireita
			
		if j == 4:
			
			$"../espaco4".texture = rotaDireita
		
		if j == 5:
			$"../espaco5".texture = rotaDireita
		
		if j == 6:
			$"../espaco6".texture = rotaDireita
			
		if j == 7:
			$"../espaco7".texture = rotaDireita
		
		if j == 8:
			$"../espaco8".texture = rotaDireita
		
		if j == 9:
			$"../espaco9".texture = rotaDireita
			
		if j == 10:
			$"../espaco10".texture = rotaDireita
		break
	
	if (comandos.size() < 10):	
		comandos.append("direita")
		print(comandos)
	
func _on_touchEsquerda_pressed():
	j += 1
	while j <= 10:
		if j == 1:
			$"../espaco1".texture = rotaEsquerda
		
		if j == 2:
			$"../espaco2".texture = rotaEsquerda
		
		if j == 3:
			$"../espaco3".texture = rotaEsquerda
			
		if j == 4:
			$"../espaco4".texture = rotaEsquerda
		
		if j == 5:
			$"../espaco5".texture = rotaEsquerda
		
		if j == 6:
			$"../espaco6".texture = rotaEsquerda
			
		if j == 7:
			$"../espaco7".texture = rotaEsquerda
		
		if j == 8:
			$"../espaco8".texture = rotaEsquerda
		
		if j == 9:
			$"../espaco9".texture = rotaEsquerda
			
		if j == 10:
			$"../espaco10".texture = rotaEsquerda
		break
	
	if (comandos.size() < 10):	
		comandos.append("esquerda")
		print(comandos)
func _on_touchAvancar_pressed():
	j += 1
	while j <= 10:
		if j == 1:
			$"../espaco1".texture = reto
		
		elif j == 2:
			$"../espaco2".texture = reto
		
		elif j == 3:
			$"../espaco3".texture = reto
			
		elif j == 4:
			$"../espaco4".texture = reto
		
		elif j == 5:
			$"../espaco5".texture = reto
		
		elif j == 6:
			$"../espaco6".texture = reto
			
		elif j == 7:
			$"../espaco7".texture = reto
		
		elif j == 8:
			$"../espaco8".texture = reto
		
		elif j == 9:
			$"../espaco9".texture = reto
			
		elif j == 10:
			$"../espaco10".texture = reto
		break
	if (comandos.size() < 10):
		comandos.append("avançar")
		print(comandos)
	
func _on_touchIniciar_pressed(): #botão que lê e executa o console
	for i in range(0, comandos.size()):
		if(comandos[i] == "direita"):
			girarDireita()
			print("direita")
			yield(get_tree().create_timer(1.2), "timeout")
		elif(comandos[i] == "esquerda"):
			girarEsquerda()
			print("esquerda")
			yield(get_tree().create_timer(1.2), "timeout")
		elif (comandos[i] == "avançar"):
			movimentoReto()
			print("reto")
			yield(get_tree().create_timer(1.2), "timeout")
	comandos.clear()
	if comandos == []:
		$"../espaco1".texture = null
		$"../espaco2".texture = null
		$"../espaco3".texture = null
		$"../espaco4".texture = null
		$"../espaco5".texture = null
		$"../espaco6".texture = null
		$"../espaco7".texture = null
		$"../espaco8".texture = null
		$"../espaco9".texture = null
		$"../espaco10".texture = null
		j = 0
		
		
	
	
func girarDireita(): #funções de movimento do personagem
	$RayCast2D.cast_to = $RayCast2D.cast_to.rotated(anguloRad)
	
func girarEsquerda():
	$RayCast2D.cast_to = $RayCast2D.cast_to.rotated(-anguloRad)
func movimentoReto():
	andando = true
	
func _ready():
	$RayCast2D.cast_to = $RayCast2D.cast_to.rotated(-PI/2)
	$Sprite.texture = pescador
func _process(delta):
	
	if andando:
		$".".move_and_slide(2.659*$RayCast2D.cast_to)
		if get_slide_collision(0) != null or $".".position.x > x + 200:
			yield(get_tree().create_timer(0.475),"timeout")
			andando = false
#			if get_slide_collision(0) != null:
#				self.position.x -= 5	
#				andando = false
			
		#move_and_slide(Vector2(2,2))*$RayCast2D.cast_to
		
#		move_and_slide(2.7*$RayCast2D.cast_to)
#		yield(get_tree().create_timer(0.5),"timeout")
#		andando = false
