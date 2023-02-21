extends KinematicBody2D

var toqueDireita = false
var toqueBaixo = false
var toqueCima = false
var toqueEsquerda = false
var coletavel1 = false
var movimento2 = Vector2.ZERO

func _ready():
	pass
	
func _physics_process(delta):
	if toqueBaixo == false and toqueCima == false and toqueEsquerda == false and toqueDireita == false:
		movimento2.x = 0
		movimento2.y = 0
	
	if toqueDireita:
		movimento2.x = 50000
		toqueDireita = false
		
	if toqueBaixo:
		movimento2.y = 50000
		toqueBaixo = false
		
	if toqueCima:
		movimento2.y = -50000
		toqueCima = false
		
	if toqueEsquerda:
		movimento2.x = -50000
		toqueEsquerda = false
		
	if coletavel1:
		$"../coletavel1".hide()
	
		
	move_and_slide(movimento2)
		
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

func _on_Area2D_body_entered(body):
	coletavel1 = true

	
