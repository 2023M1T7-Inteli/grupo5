extends Node2D

#func _on_RespostaCerta_pressed():
	#get_tree().change_scene()
	
func _on_RespostaErrada1_pressed():
	get_tree().change_scene("res://Cenas/TenteNovamente.tscn")

func _on_Resposta_errada_2_pressed():
	get_tree().change_scene("res://Cenas/TenteNovamente.tscn")
