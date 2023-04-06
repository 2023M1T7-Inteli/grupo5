extends Node2D



#Aqui tem a função do botão VOLTAR no menu de orientação.
func _on_voltar_pressed():
	get_tree().change_scene("res://menu/Menu.tscn")
