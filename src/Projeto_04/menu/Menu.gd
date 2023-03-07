extends Control

#Declaração de variáveis para tocar música no menu.
onready var musicaTocando = $musica/AudioStreamPlayer
onready var musicBotao = $buttonFx

# Função que faz o botão sair funcionar (Tela inicial)
func _on_botaosair_pressed():
	musicBotao.playing
	get_tree().quit()

#Aqui tem a função que faz o botão de orientação funcionar.
func _on_Button_pressed(): #Botão de orientação.
	musicBotao.playing
	get_tree().change_scene("res://Cenas/orientação.tscn")

#Aqui tem a função que desliga e liga a música.
func _on_musica_pressed():
	if musicaTocando.playing: musicaTocando.stop()
	else: musicaTocando.play()

#Botão para sair.
func _on_botooplcoes_pressed():
	musicBotao.playing
	get_tree().quit()

#Função que faz o botão jogar funcionar.
func _on_botojogar_pressed():
	get_tree().change_scene("res://Cenas/cena1.tscn")
