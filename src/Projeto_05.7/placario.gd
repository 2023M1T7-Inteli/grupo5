extends Area2D

func _on_placario_body_entered(body):
	print("entrou")
	if body.is_in_group("jangada"):
		print("era pra trocar")
		get_tree().change_scene("res://desafio2.tscn")
