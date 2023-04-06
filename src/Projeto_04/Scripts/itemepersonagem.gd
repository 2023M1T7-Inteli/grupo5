extends Area2D

#Aqui estão os códigos da interação. Onde o item coletável irá transportar o jogador para outra tela (portal).

#Função que corresponde ao contato entre os corpos (personagem e item).
func _on_item1_body_entered(body):
	#Se haver contato entre o item e objetos do grupo "Player", que nesse caso é o jogador, haverá uma interação. Nesse caso, a troca de mapa.
	if body.is_in_group("Player"):
		body.item = true
		queue_free()
		get_tree().change_scene("res://Cenas/desafio1.tscn")

