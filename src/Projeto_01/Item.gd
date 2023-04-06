extends Node2D

#Nomeação das variáveis
var pegarItem1= get_tree().change_scene("res://desafio1.tscn")
var pegarItem= false


#Função que relaciona como TRUE o contato entre os objetos.
func _on_Area2D_body_entered(body):
	pegarItem = true

#Função que relaciona a saída de contato entre os objetos.
func _on_Area2D_body_exited(body):
	pegarItem = false

#Função que irá rodar quando o objeto entrar em cena.
#Nesse caso, irá verificar se o contato é TRUE
#Se o contato for TRUE, haverá interação.
func _physics_process(delta):
	if pegarItem == true and Input.is_action_just_pressed("ui_end"):
		add_child(pegarItem1)
		



