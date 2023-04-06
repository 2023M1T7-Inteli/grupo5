extends Control
#manu
#manu
#Declaração de variáveis para tocar música no menu.
onready var musicaTocando = $musica/AudioStreamPlayer
onready var musicaBotao = $buttonFx

# Função que faz o botão sair funcionar (Tela inicial)
func _on_botaosair_pressed():
	musicaBotao.playing
	get_tree().quit()

#Aqui tem a função que faz o botão de orientação funcionar.
func _on_Button_pressed(): #Botão de orientação.
	musicaBotao.playing
	yield(get_tree().create_timer(0.25), "timeout")
	$buttonFx.play()
	get_tree().change_scene("res://Cenas/orientação.tscn")

#Aqui tem a função que desliga e liga a música.
func _on_musica_pressed():
	if musicaTocando.playing: musicaTocando.stop()
	else: musicaTocando.play()

#Botão para sair.
func _on_botooplcoes_pressed():
	musicaBotao.playing
	yield(get_tree().create_timer(0.25), "timeout")
	get_tree().quit()

#Função que faz o botão jogar funcionar.
func _on_botojogar_pressed():
	yield(get_tree().create_timer(0.25), "timeout")
	get_tree().change_scene("res://Cenas/cena1.tscn")
	
