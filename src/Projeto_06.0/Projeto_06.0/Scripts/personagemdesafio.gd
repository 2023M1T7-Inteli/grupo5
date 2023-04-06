extends KinematicBody2D
#Declaração de variáveis de movimentação e troca de cenário.
var toqueDireita = false
var toqueBaixo = false
var toqueCima = false
var toqueEsquerda = false
var listaComandos = []
var contador = 0
var iniciar = false
var x
var y
var listaSetas = []
onready var movimento = $AnimationPlayer

#Função que lê quando o mapa é carregado.
func _ready():
	contador = 0
	
	$"../Direita1".visible = false
	$"../Direita2".visible = false
	$"../Direita3".visible = false
	$"../Direita4".visible = false
	
	$"../Esquerda1".visible = false
	$"../Esquerda2".visible = false
	$"../Esquerda3".visible = false
	$"../Esquerda4".visible = false
	
	$"../Baixo1".visible = false
	$"../Baixo2".visible = false
	$"../Baixo3".visible = false
	$"../Baixo4".visible = false
	
	$"../Cima1".visible = false
	$"../Cima2".visible = false
	$"../Cima3".visible = false
	$"../Cima4".visible = false
	
#Função que sempre processa no mapa.
#Função que executa os movimentos da lista.
func _physics_process(delta):
	if toqueDireita:
		movimento.play("direita")
		$".".move_and_slide(30*Vector2(2,0))
		if get_slide_collision(0) != null or $".".position.x > x + 63:
			if get_slide_collision(0) != null:
				self.position.x -= 5	
			toqueDireita = false
			iniciar = false
			_on_iniciar_pressed()
	
	if toqueBaixo:
		movimento.play("descer")
		$".".move_and_slide(30*Vector2(0,2))
		if get_slide_collision(0) != null or $".".position.y > y + 62:
			if get_slide_collision(0) != null:
				self.position.y -= 5
			toqueBaixo = false
			iniciar = false
			_on_iniciar_pressed()
		
	if toqueCima:
		movimento.play("subir")
		self.move_and_slide(-30*Vector2(0,2))
		if get_slide_collision(0) != null or $".".position.y < y - 62:
			if get_slide_collision(0) != null:
				self.position.y += 5
			toqueCima = false
			iniciar = false
			_on_iniciar_pressed()

	if toqueEsquerda:
		movimento.play("esquerda")
		$".".move_and_slide(-30*Vector2(2,0))
		if get_slide_collision(0) != null or $".".position.x < x - 63:
			if get_slide_collision(0) != null:
				self.position.x += 5
			toqueEsquerda = false
			iniciar = false
			_on_iniciar_pressed()
		
	if toqueEsquerda == false and toqueBaixo == false and toqueCima == false and toqueDireita == false:
		movimento.play("parado")
	
	
func ini():
	iniciar = true
	if contador == listaComandos.size():
		iniciar = false
		print(iniciar)
	
#Função que executa quando clicar o botão de play no console.
func _on_iniciar_pressed():
	if iniciar == false:
		ini()
		Global.mao = Global.mao + 1
		x = $".".position.x
		y = $".".position.y
		
		if contador != listaComandos.size():
			if listaComandos[contador] == "direita":
				contador += 1
				toqueDireita = true
				
			elif listaComandos[contador] == "baixo":
				contador += 1
				toqueBaixo = true
				
			elif listaComandos[contador] == "esquerda":
				contador += 1
				toqueEsquerda = true
				
			elif listaComandos[contador] == "cima":
				contador += 1
				toqueCima = true
		else:
			listaComandos = []
			listaSetas = []
			contador = 0
			$"../Direita1".visible = false
			$"../Direita2".visible = false
			$"../Direita3".visible = false
			$"../Direita4".visible = false
		
			$"../Esquerda1".visible = false
			$"../Esquerda2".visible = false
			$"../Esquerda3".visible = false
			$"../Esquerda4".visible = false
		
			$"../Baixo1".visible = false
			$"../Baixo2".visible = false
			$"../Baixo3".visible = false
			$"../Baixo4".visible = false
		
			$"../Cima1".visible = false
			$"../Cima2".visible = false
			$"../Cima3".visible = false
			$"../Cima4".visible = false
#Função que manda o comando BAIXO para o personagem.
func _on_baixo_pressed():
	if iniciar == false:
		Global.mao = Global.mao + 1
		listaSetas.append("baixo")
		if listaSetas.size() < 5:
			listaComandos.append("baixo")
	
#Função que manda o comando DIREITA para o personagem.
func _on_direita_pressed():
	if iniciar == false:
		Global.mao = Global.mao + 1
		listaSetas.append("direita")
		if listaSetas.size() < 5:
			listaComandos.append("direita")

#Função que manda o comando CIMA para o personagem.
func _on_cima_pressed():
	if iniciar == false:
		listaSetas.append("cima")
		if listaSetas.size() < 5:
			listaComandos.append("cima")
	
#Função que manda o comando ESQUERDA para o personagem.
func _on_esquerda_pressed():
	if iniciar == false:
		listaSetas.append("esquerda")
		if listaSetas.size() < 5:
			listaComandos.append("esquerda")
		
func _process(delta):
	if iniciar:
		print(iniciar)
#Função que processa constantemente no mapa.
	if listaSetas.size() < 5 and listaSetas.size() >= 1:
		for i in range(len(listaSetas)):
			if listaSetas[i] == "esquerda":
				get_node("../Esquerda"+str(i+1)).visible = true
		#print(listaSetas)
	
		for i in range (len(listaSetas)):
			 if listaSetas[i] == "direita":
					get_node("../Direita"+str(i+1)).visible = true
			
		for i in range (len(listaSetas)):
			 if listaSetas[i] == "cima":
					get_node("../Cima"+str(i+1)).visible = true
					
		for i in range (len(listaSetas)):
			if listaSetas[i] == "baixo":
				get_node("../Baixo"+str(i+1)).visible = true

#Função que para o movimento quando o player encontra colisão.
func _on_paredeinvisivel_body_entered(body):
	toqueCima = false
