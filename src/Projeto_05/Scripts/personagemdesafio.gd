extends KinematicBody2D
#Declaração de variáveis de movimentação e troca de cenário.
var toqueDireita = false
var toqueBaixo = false
var toqueCima = false
var toqueEsquerda = false
var listaComandos = []
var contador = 0
var iniciar	= false
var x
var y
var listaSetas = []
#Movimentação do personagem
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
	
func _physics_process(delta):
	if toqueDireita:
		$".".move_and_slide(24*Vector2(2,0))
		if $".".position.x > x + 100:
			toqueDireita = false
			_on_iniciar_pressed()
	
	if toqueBaixo:
		$".".move_and_slide(24*Vector2(0,2))
		if $".".position.y > y + 100:
			toqueBaixo = false
			_on_iniciar_pressed()
		
	if toqueCima:
		$".".move_and_slide(-24*Vector2(0,2))
		if $".".position.y < y - 100:
			toqueCima = false
			_on_iniciar_pressed()
		
	if toqueEsquerda:
		$".".move_and_slide(-24*Vector2(2,0))
		if $".".position.x < x - 100:
			toqueEsquerda = false
			_on_iniciar_pressed()
			
	
func _on_iniciar_pressed():
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
	
	
func _on_baixo_pressed():
	listaSetas.append("baixo")
	
	if listaSetas.size() < 5:
		print("baixo")
		listaComandos.append("baixo")
	else:
		print("não cabe mais elementos")
		
	
func _on_direita_pressed():
	listaSetas.append("direita")
	
	if listaSetas.size() < 5:
		listaComandos.append("direita")
func _on_cima_pressed():
	listaSetas.append("cima")
	
	if listaSetas.size() < 5:
		listaComandos.append("cima")
	
func _on_esquerda_pressed():
	listaSetas.append("esquerda")
	if listaSetas.size() < 5:
		listaComandos.append("esquerda")
		
func _process(delta):
	if listaSetas.size() < 5 and listaSetas.size() >= 1:
		for i in range(len(listaSetas)):
			if listaSetas[i] == "esquerda":
				get_node("../Esquerda"+str(i+1)).visible = true
		print(listaSetas)
	
		for i in range (len(listaSetas)):
			 if listaSetas[i] == "direita":
					get_node("../Direita"+str(i+1)).visible = true
			
		for i in range (len(listaSetas)):
			 if listaSetas[i] == "cima":
					get_node("../Cima"+str(i+1)).visible = true
					
		for i in range (len(listaSetas)):
			if listaSetas[i] == "baixo":
				get_node("../Baixo"+str(i+1)).visible = true


func _on_paredeinvisivel_body_entered(body):
	toqueCima = false
