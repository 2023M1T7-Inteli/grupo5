extends KinematicBody2D

var comandos = []
var graus = 90
var anguloRad = deg2rad(graus)
var rotaDireita = load("res://botões/botão_voltar.png")
var rotaEsquerda = load("res://console/setaantihora.png")
var reto = load ("res://console/seta_grande1-removebg-preview (1).png")
var pescador = load("res://Imagens/jangada_lado.png")
var x = 0
var y = 0
var andando = false
var j = 0
	
func _on_touchDireita_pressed(): 
	j += 1
	while j <= 10: #load das sprites no console.
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
	
	if (comandos.size() < 10):	#appenda 'direita' na lista de comandos.
		comandos.append("direita")
	
func _on_touchEsquerda_pressed():
	j += 1
	while j <= 10: #load das sprites no console.
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
		comandos.append("esquerda") #appenda 'esquerda' na lista de comandos.

func _on_touchAvancar_pressed():
	j += 1
	while j <= 10: #load das sprites no console.
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
	if (comandos.size() < 10): #appenda 'avançar' na lista de comandos.
		comandos.append("avançar")
	
func _on_touchIniciar_pressed(): #botão que lê e executa o console.
	for i in range(0, comandos.size()):
		
		if(comandos[i] == "direita"):
			girarDireita() #chama função girarDireita.
			yield(get_tree().create_timer(1.2), "timeout") #intervalo de 1 segundo em a execução dos comandos.
			
		elif(comandos[i] == "esquerda"):
			girarEsquerda() #chama função girarEsquerda.
			yield(get_tree().create_timer(1.2), "timeout") #intervalo de 1 segundo em a execução dos comandos.
			
		elif (comandos[i] == "avançar"):
			movimentoReto() #chama função movimentoReto.
			yield(get_tree().create_timer(1.2), "timeout") #intervalo de 1 segundo em a execução dos comandos.
			
	comandos.clear() #limpa o array de comandos.
	
	if comandos == []: #console vazio se lista de comandos estiver vazia.
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

	
func girarDireita(): #função de rotação em 90 graus sentido horário.
	$RayCast2D.cast_to = $RayCast2D.cast_to.rotated(anguloRad)
	
func girarEsquerda():  #função de rotação em 90 graus sentido anti horário.
	$RayCast2D.cast_to = $RayCast2D.cast_to.rotated(-anguloRad)
	
func movimentoReto(): #função intermediária do avanço do personagem.
	andando = true
	
func _ready():
	$RayCast2D.cast_to = $RayCast2D.cast_to.rotated(-PI/2) #define a direção do eixo x positivo.
	
func _process(delta):
	if andando:
		#$".".move_and_slide(2.659*$RayCast2D.cast_to) #função que avança o personagem em direção ao eixo x positivo do mesmo.
		$".".move_and_slide(2.659*$RayCast2D.cast_to)
		yield(get_tree().create_timer(0.475),"timeout")
		andando = false
		
		if get_slide_collision(0) != null: #parar o personagem se colidir ou se x > x + 200.
		 #tempo que o personagem se move pra frente.
			self.position.x -= 5	
			andando = false #'desativa' o andando 
			
		
#	if get_slide_collision(0) != null or $".".position.x > x + 63:
#		if get_slide_collision(0) != null:
#			self.position.x -= 5	
#		reto = false
#		_on_touchIniciar_pressed()
			