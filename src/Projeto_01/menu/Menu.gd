extends Control
onready var musicaTocando = $musica/AudioStreamPlayer

	
# Essa função faz o botão jogar funcionar. Direcionando ele pro cenário 1.
func _on_botojogar_pressed():
	get_tree().change_scene("res://cena1.tscn")


# Função que faz o botão sair funcionar (Tela inicial)
func _on_botaosair_pressed():
	get_tree().quit()


func _on_Button_pressed():
	get_tree().change_scene("res://orientação.tscn")


func _on_musica_pressed():
	if musicaTocando.playing: musicaTocando.stop()
	else: musicaTocando.play()
