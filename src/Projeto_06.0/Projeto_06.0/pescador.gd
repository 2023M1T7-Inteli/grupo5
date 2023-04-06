extends KinematicBody2D

#Declaração de variáveis
var play = false
var iniciar = false
var colisao = false
var comandos = []
var parado = false
var graus = 90
var anguloRad = deg2rad(graus)
var rotaDireita = load("res://HUD/giro direita.png")
var rotaEsquerda = load("res://HUD/giro esquerda.png")
var reto = load ("res://HUD/seta direita.png")
var pescador = load("res://Imagens/jangada_lado.png")
var personagemDescendo = load("res://personagem 2/jangada frente.png")
var x = 0
var y = 0
var andando = false
var j = 0
var voltarBai = false
var k = 0

#Função que apresenta a seta direita no console e adiciona na lista
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

#Função que apresenta a seta esquerda no console e adiciona na lista
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

#Função que apresenta a seta reto no console e adiciona na lista
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

#Função que executa a função play
func _on_touchIniciar_pressed(): #botão que lê e executa o console.
		if (iniciar == false):
			play()

#Função que rotaciona o personagem no sentido horário
func girarDireita(): #função de rotação em 90 graus sentido horário.
	$RayCast2D.cast_to = $RayCast2D.cast_to.rotated(anguloRad)

#Função que rotaciona o personagem no sentido anti-horário
func girarEsquerda():  #função de rotação em 90 graus sentido anti horário.
	$RayCast2D.cast_to = $RayCast2D.cast_to.rotated(-anguloRad)

##função que executa o comando reto
func movimentoReto(): #função intermediária do avanço do personagem.
	andando = true

#Função que lê uma vez ápos o carregamento do mapa.
func _ready():
	$descendo.visible = false
	$".".visible = false
	$RayCast2D.cast_to = Vector2.RIGHT #define a direção do eixo x positivo.

#Função que executa constantemente ápos o mapa ser carregado
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
		$".".move_and_slide(157.45*$RayCast2D.cast_to) #função que avança o personagem em direção ao eixo x positivo do mesmo.
		yield(get_tree().create_timer(0.4),"timeout")
		andando = false #'desativa' o andando


func parado1(): # função para detectar colisão no eixo y, para baixo, e fazer com que o personagem volte 10 pixels
	parado = true
	colisao = false
	andando = false
	if parado == true:
		self.position.y -= 10
		parado = false

func parado2(): # função para detectar colisão no eixo y, para cima, e fazer com que o personagem volte 10 pixels
	parado = true
	colisao = false
	andando = false
	if parado == true:
		self.position.y += 10
		parado = false

func parado3(): # função para detectar colisão no eixo x, para direita, e fazer com que o personagem volte 10 pixels
	parado = true
	colisao = false
	andando = false
	if parado == true:
		self.position.x -= 10
		parado = false

func parado4(): # função para detectar colisão no eixo x, para o lado direito, e fazer com que o personagem volte 10 pixels
	parado = true
	colisao = false
	andando = false
	if parado == true:
		self.position.x += 10
		parado = false

func _on_Area2D_body_entered(body): # função que detecta se o colison do personagem entrou na parede inisível
	if body.is_in_group("boneco"):
		colisao = true
		print(colisao)

func play(): # função que é executada ao ser pressionado o botão iniciar,impedindo que seja adicionado mais elementos no console
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

func _on_Bau1_body_entered(body): # função executada quando o personagem colide com o colision do personagem - bau 1
	if body.is_in_group("boneco"):
		$"../PreDesafio1".visible = true
		$".".visible = false

func _on_PreDesafio_pressed(): # função executada quando o personagem colide com o colision do personagem - bau 2
	$"../PreDesafio1".visible = false
	$"../DesafioMat1".visible = true
	$"../Bau1".visible = false

func _on_RespostaCerta1_pressed(): # Resposta errada do bau
	$"../DesafioMat1".visible = false
	$"../TenteNovamente".visible = true

func _on_RespostaErrada11_pressed(): # Resposta errada do bau
	$"../DesafioMat1".visible = false
	$"../TenteNovamente".visible = true

func _on_Resposta_errada_12_pressed(): # Resposta certa do bau
	$"../DesafioMat2".visible = true
	$"../DesafioMat1".visible = false
	$".".visible = false
	
	
func _on_RespostaCerta2_pressed(): # Resposta certa do bau 
	$"../DesafioMat2".visible = false
	$"../TenteNovamente".visible = true

func _on_RespostaErrada21_pressed(): # Resposta errada do bau
	$"../DesafioMat2".visible = false
	$"../DesafioMat3".visible = true

func _on_Resposta_errada_22_pressed(): # Resposta errada do bau
	$"../DesafioMat2".visible = false
	$"../TenteNovamente".visible = true
	
func _on_RespostaCerta3_pressed(): # Resposta certa do bau
	$"../DesafioMat3".visible = false
	$"../Premio".visible = true

func _on_RespostaErrada31_pressed(): # Resposta errada do bau
	$"../DesafioMat3".visible = false
	$"../TenteNovamente2".visible = true

func _on_Resposta_errada_32_pressed(): # Resposta errada do bau
	$"../DesafioMat3".visible = false
	$"../TenteNovamente2".visible = true

func _on_TentarDenovo_pressed(): # Resposta errada do bau
	$"../TenteNovamente2".visible = false
	$"../DesafioMat1".visible = true

func _on_Premio_pressed(): # Ao colocar resposta certa, o usuário ganha um prêmio
	$"../Premio".visible = false
	$"../Bau1".visible = false
	$".".visible = true
	Global.pontos += 15



func _on_Bau2_body_entered(body):	# função que abre o baú ao detectar se um corpo entrou em sua área de colisão
	if body.is_in_group("boneco"):
		$"../PreDesafio2".visible = true
		$".".visible = false

func _on_PreDesafio2_pressed(): # função executada quando o personagem colide com o colision do personagem - bau 1
	$"../PreDesafio2".visible = false
	$"../DesafioMat4".visible = true
	

func _on_RespostaCerta12_pressed(): # Resposta errada do bau
	$"../DesafioMat4".visible = false
	$"../TenteNovamente2".visible = true

func _on_RespostaErrada112_pressed(): # Resposta errada do bau
	$"../DesafioMat4".visible = false
	$"../TenteNovamente2".visible = true

func _on_Resposta_errada_122_pressed(): # Resposta certa do bau
	$"../DesafioMat5".visible = true
	$"../DesafioMat4".visible = false
	$".".visible = false
	
	
func _on_RespostaCerta22_pressed(): # Resposta errada do bau
	$"../DesafioMat5".visible = false
	$"../TenteNovamente2".visible = true

func _on_RespostaErrada212_pressed(): # Resposta certa do bau
	$"../DesafioMat5".visible = false
	$"../DesafioMat6".visible = true
	
func _on_Resposta_errada_222_pressed(): # Resposta errada do bau
	$"../DesafioMat5".visible = false
	$"../TenteNovamente2".visible = true
	
func _on_RespostaCerta32_pressed(): # Resposta certa do bau
	$"../DesafioMat6".visible = false
	$"../Premio".visible = true

func _on_Resposta_errada_322_pressed(): # Resposta errada do bau
	$"../DesafioMat6".visible = false
	$"../TenteNovamente2".visible = true

func _on_TentarDenovo2_pressed(): # Ao colocar respostas erradas, a função tente novamente aparece na tela
	$"../DesafioMat4".visible = true
	$"../TenteNovamente2".visible = false

func _on_Premio2_pressed(): # Premio para o usuário quando acerta a resposta
	$"../Premio2".visible = false
	$".".visible = true
	Global.pontos += 15

func _on_RespostaErrada312_pressed():  # Resposta errada do bau
	$"../DesafioMat6".visible = false
	$"../TenteNovamente2".visible = true


func _on_RespostaCerta322_pressed(): # Resposta certa do bau
	$"../DesafioMat6".visible = false
	$"../Premio2".visible = true

func _on_Resposta_errada_3222_pressed(): # Resposta errada do bau
	$"../DesafioMat6".visible = false
	$"../TenteNovamente2".visible = true
