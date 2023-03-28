extends Area2D

#Função que corresponde ao contato entre os corpos (personagem e item).
func _on_item1_body_entered(body):
	#Se haver contato entre o item e objetos do grupo "garoto", que nesse caso é o jogador, haverá uma interação. Nesse caso, a troca de mapa.
	if body.is_in_group("garoto"):
		get_tree().change_scene("res://Cenas/Desafio1.tscn")

