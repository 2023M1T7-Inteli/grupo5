extends Node2D

#Aqui estamos colocando a tela preta no canto direito do desafio para receber os comandos.
var interfaceg = preload("res://Cenas/interface.tscn").instance()
#Declarando uma variável para a coleta do item.
var coletavel1 = false

#Quando o mapa carregar, os pontos do jogador será 0.
func _ready():
	Global.pontos = 0
	print(Global.pontos)
#Aqui tem um código que não vamos utilizar no momento, mas poderá ser útil no futuro.
#	get_tree().current_scene.add_child(interfaceg)

#Aqui a função Process Delta sempre irá contabilizar os pontos do jogador no canto inferior direito.	
func _process(delta):
	$ColorRect/pontosnume.text = String(Global.pontos)

#Aqui quando pegamos os itens 1, 2 e 3 eles somem e contam 3 pontos para o jogador.
func _on_coletavel1_body_entered(body):
	Global.pontos = Global.pontos + 3
	$coletavel1.hide()
	$coletavel2.hide()
	$coletavel3.hide()
	
#Aqui quando pegamos o coletavel 4, 5 e 6 eles somem e contam mais 3 pontos para o jogador.
func _on_coletavel4_body_entered(body):
	Global.pontos = Global.pontos + 3
	$coletavel4.hide()
	$coletavel5.hide()
	$coletavel6.hide()
