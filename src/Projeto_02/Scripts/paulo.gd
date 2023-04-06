extends KinematicBody2D

var toqueDireita = false
var toqueBaixo = false
var toqueCima = false
var toqueEsquerda = false
var movimento2 = Vector2.ZERO
	
func _physics_process(delta):
	if toqueBaixo == false and toqueCima == false and toqueEsquerda == false and toqueDireita == false:
		movimento2.x = 0
		movimento2.y = 0
	
	if toqueDireita:
		movimento2.x = 500
		toqueDireita = false
		
	if toqueBaixo:
		movimento2.y = 500
		toqueBaixo = false
		
	if toqueCima:
		movimento2.y = -500
		toqueCima = false
		
	if toqueEsquerda:
		movimento2.x = -500
		toqueEsquerda = false
		
	move_and_collide(movimento2)
	
	
		
# Adicione esse código ao script do objeto que deseja controlar
# Variável que armazena a velocidade do objeto

func _on_baixo_pressed():
	toqueBaixo = true
	
func _on_direita_pressed():
	toqueDireita = true
	
func _on_cima_pressed():
	toqueCima = true

func _on_esquerda_pressed():
	toqueEsquerda = true
