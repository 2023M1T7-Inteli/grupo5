extends Control

#Declaração de variáveis para tocar música no menu.
onready var musicaTocando = $musica/AudioStreamPlayer
onready var musicBotao = $buttonFx

# Função que faz o botão sair funcionar (Tela inicial)
func _on_botaosair_pressed():
	get_tree().quit()

#Aqui tem a função que faz o botão de orientação funcionar.
func _on_Button_pressed(): #Botão de orientação.
	yield(get_tree().create_timer(2), "timeout")
	$buttonFx.play()
	get_tree().change_scene("res://Cenas/orientação.tscn")

#Aqui tem a função que desliga e liga a música.
func _on_musica_pressed():
	if musicaTocando.playing: musicaTocando.stop()
	else: musicaTocando.play()

#Botão para sair.
func _on_botooplcoes_pressed():
	yield(get_tree().create_timer(0.25), "timeout")
	get_tree().quit()

#Função que faz o botão jogar funcionar.
func _on_botojogar_pressed():
	yield(get_tree().create_timer(0.25), "timeout")
	musicBotao.play()
	get_tree().change_scene("res://Cenas/cena1.tscn")
	musicBotao.stop()
