extends KinematicBody2D

var play = false
var iniciar = false
var colisao = false
var comandos = []
var parado = false
var graus = 90
var anguloRad = deg2rad(graus)
var rotaDireita = load("res://HUD/giro direita.png")
var rotaEsquerda = load("res://HUD/giro esquerda.png")
var reto = load ("res://console/seta_grande1-removebg-preview (1).png")
var pescador = load("res://Imagens/jangada_lado.png")
var personagemDescendo = load("res://personagem 2/jangada frente.png")
var x = 0
var y = 0
var andando = false
var j = 0
var voltarBai = false
var k = 0


func _on_touchDireita_pressed(): 
	if iniciar == false:
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
			k += 1
			comandos.append("direita")
	
func _on_touchEsquerda_pressed():
	if iniciar == false:
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
			k += 1
			comandos.append("esquerda") #appenda 'esquerda' na lista de comandos.

func _on_touchAvancar_pressed():
	if iniciar == false:
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
			k += 1
			comandos.append("avançar")
	
func _on_touchIniciar_pressed(): #botão que lê e executa o console.
		if (iniciar == false):
			play()

func girarDireita(): #função de rotação em 90 graus sentido horário.
	$RayCast2D.cast_to = $RayCast2D.cast_to.rotated(anguloRad)
	
func girarEsquerda():  #função de rotação em 90 graus sentido anti horário.
	$RayCast2D.cast_to = $RayCast2D.cast_to.rotated(-anguloRad)
	
func movimentoReto(): #função intermediária do avanço do personagem.
	andando = true
	
func _ready():
	$descendo.visible = false
	$RayCast2D.cast_to = Vector2.RIGHT #define a direção do eixo x positivo.
func _process(delta):
	
	if $RayCast2D.cast_to.is_equal_approx(Vector2.DOWN):
		$descendo.visible = true
		$JangadaCostas.visible = false
		$Jangadaesquerda.visible = false
		$Jangadaladodireito.visible = false
		if colisao == true:
			parado1()
		
	elif $RayCast2D.cast_to.is_equal_approx(Vector2.UP):
		$descendo.visible = false
		$JangadaCostas.visible = true
		$Jangadaesquerda.visible = false
		$Jangadaladodireito.visible = false
		if colisao == true:
			parado2()
			
	elif $RayCast2D.cast_to.is_equal_approx(Vector2.RIGHT):
		$descendo.visible = false
		$JangadaCostas.visible = false
		$Jangadaesquerda.visible = false
		$Jangadaladodireito.visible = true
		if colisao == true:
			parado3()
		
	elif $RayCast2D.cast_to.is_equal_approx(Vector2.LEFT):
		$descendo.visible = false
		$JangadaCostas.visible = false
		$Jangadaesquerda.visible = true
		$Jangadaladodireito.visible = false
		if colisao == true:
			parado4()
			
	if andando:
		$".".move_and_slide(157.15*$RayCast2D.cast_to) #função que avança o personagem em direção ao eixo x positivo do mesmo.
		yield(get_tree().create_timer(0.4),"timeout")
		andando = false #'desativa' o andando 
			
func parado1():
	parado = true
	colisao = false
	andando = false
	if parado == true:
		self.position.y -= 10
		parado = false
	
func parado2():
	parado = true
	colisao = false
	andando = false
	if parado == true:
		self.position.y += 10
		parado = false

func parado3():
	parado = true
	colisao = false
	andando = false
	if parado == true:		
		self.position.x -= 10
		parado = false

func parado4():
	parado = true
	colisao = false
	andando = false
	if parado == true:
		self.position.x += 10
		parado = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("boneco"):
		colisao = true
		print(colisao)

func play():
	iniciar = true
	if iniciar == true:
		for cont in range(0, comandos.size()):
			if(comandos[cont] == "direita"):
				girarDireita() #chama função girarDireita.
				yield(get_tree().create_timer(1.2), "timeout") #intervalo de 1 segundo em a execução dos comandos.
				
			elif(comandos[cont] == "esquerda"):
				girarEsquerda() #chama função girarEsquerda.
				yield(get_tree().create_timer(1.2), "timeout") #intervalo de 1 segundo em a execução dos comandos.
					
			elif (comandos[cont] == "avançar"):
				movimentoReto() #chama função movimentoReto.
				yield(get_tree().create_timer(1.2), "timeout") #intervalo de 1 segundo em a execução dos comandos.
		iniciar = false	
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
			
