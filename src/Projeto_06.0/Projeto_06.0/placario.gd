extends Area2D

func _on_placario_body_entered(body): #reconhece que houve a colisão.
	if body.is_in_group("jangada"): #se o body que entrou em colisão for do grupo 'jangada', troca de cena.
		get_tree().change_scene("res://desafio2.tscn")
