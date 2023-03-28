extends Node2D

#Declaração de variáveis.
onready var pontoSom = $pontoSom
onready var musicaTocando = $musica/AudioStreamPlayer
onready var musicBotao = $buttonFx

#Quando o mapa carregar, os pontos do jogador serão 0.
#Função que processa logo o mapa carregar.
func _ready():
	$Tut2/continuar2.position = Vector2(-200,0)
	$PreDesafio.visible = false
	$DesafioMat1.visible = false
	$DesafioMat2.visible = false
	$DesafioMat3.visible = false
	$TenteNovamente.visible = false
	$Premio.visible = false
	$dedo1.visible = false
	$dedo2.visible = false
	$garotodesafio1.visible = false
	$Tut1.visible = true
	$PreDesafio2.visible = false
	$TenteNovamente2.visible = false
	$DesafioMat4.visible = false
	$DesafioMat5.visible = false
	
#Aqui a função Process Delta sempre irá contabilizar os pontos do jogador no canto inferior direito.	
func _process(delta):
	$ColorRect/pontosnume.text = String(Global.pontos)
	
	if Global.mao == 2:
		$dedo2.visible = false
		$dedo1.visible = true
		$dedo.visible = false
		
	if Global.mao == 3:
		$dedo1.visible = false
		$dedo2.visible = true
		
	if Global.mao == 4:
		$dedo2.visible = false

#Função que faz a soma de pontos quando pega as sais-gemas.
func _on_coletavel1_body_entered(body):
	Global.pontos = Global.pontos + 1
	$coletavel1.queue_free()
	pontoSom.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom.stop()
	
#Função que faz a soma de pontos quando pega as sais-gemas.
func _on_coletavel4_body_entered(body):
	Global.pontos = Global.pontos + 1
	$coletavel4.queue_free()
	pontoSom.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom.stop()

#Botão que pausa o jogo.
func _on_BotaoPausar_pressed():
	Global.pausar = true

#Função que faz a soma de pontos quando pega as sais-gemas.
func _on_coletavel2_body_entered(body):
	$coletavel2.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom.stop()
	
#Função que faz a soma de pontos quando pega as sais-gemas.
func _on_coletavel3_body_entered(body):
	$coletavel3.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom.stop()

#Função que faz a soma de pontos quando pega as sais-gemas.	
func _on_coletavel5_body_entered(body):
	$coletavel5.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom.stop()

#Função que faz a soma de pontos quando pega as sais-gemas.
func _on_coletavel6_body_entered(body):
	$coletavel6.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom.stop()
	
#Função que faz o desafio de matemática abrir.
func _on_Bau_body_entered(body):
	if body.is_in_group("Playerdesafio"):
		$PreDesafio.visible = true
		$garotodesafio1.visible = false

#Função que executa quando a resposta do desafio de MAT for correta.
func _on_RespostaCerta1_pressed():
	$DesafioMat2.visible = true
	$DesafioMat1.visible = false
	$garotodesafio1.visible = false

#Função que roda quando você erra a resposta no desafio de MAT.
func _on_RespostaErrada11_pressed():
	$DesafioMat1.visible = false
	$TenteNovamente.visible = true
	
#Função que roda quando você erra a resposta no desafio de MAT.
func _on_Resposta_errada_12_pressed():
	$DesafioMat1.visible = false
	$TenteNovamente.visible = true
	
#Função que roda quando você erra a resposta no desafio de MAT.
func _on_RespostaCerta2_pressed():
	$DesafioMat2.visible = false
	$DesafioMat3.visible = true	

#Função que roda quando você erra a resposta no desafio de MAT.
func _on_RespostaErrada21_pressed():
	$DesafioMat2.visible = false
	$TenteNovamente.visible = true

#Função que roda quando você erra a resposta no desafio de MAT.
func _on_Resposta_errada_22_pressed():
	$DesafioMat2.visible = false
	$TenteNovamente.visible = true
	
#Função que roda quando você erra a resposta no desafio de MAT.
func _on_RespostaCerta3_pressed():
	$DesafioMat3.visible = false
	$Premio.visible = true

#Função que roda quando você erra a resposta no desafio de MAT.
func _on_RespostaErrada31_pressed():
	$DesafioMat3.visible = false
	$TenteNovamente.visible = true

#Função que roda quando você erra a resposta no desafio de MAT.
func _on_Resposta_errada_32_pressed():
	$DesafioMat3.visible = false
	$TenteNovamente.visible = true

#Função que roda quando você erra a resposta no desafio de MAT.
func _on_TentarDenovo_pressed():
	$TenteNovamente.visible = false
	$DesafioMat1.visible = true

#Função que roda quando você erra a resposta no desafio de MAT.
func _on_Premio_pressed():
	$Premio.visible = false
	$Bau.visible = false
	$garotodesafio1.visible = true
	Global.pontos += 15
	
#Função que chama o desafio de MAT.
func _on_PreDesafio_pressed():
	$PreDesafio.visible = false
	$DesafioMat1.visible = true

#Função que esconde o segundo tutorial do desafio 1.
func _on_continuar2_released():
	$garotodesafio1.visible = true
	$Tut2.visible = false

#Função que esconde o primeiro tutorial do desafio 1.
func _on_continuar1_released():
	$Tut1/continuar1.position = Vector2(-200,0)
	$Tut2/continuar2.position = Vector2(882,547)
	$Tut1.visible = false
	$Tut2.visible = true

func _on_bau2_body_entered(body):
	if body.is_in_group("Playerdesafio"):
		$PreDesafio2.visible = true
		$garotodesafio1.visible = false
		
func _on_PreDesafio1_pressed():
	$PreDesafio2.visible = false
	$DesafioMat4.visible = true
	
func _on_RespostaErrada112_pressed(): #Resposta errada
	$TenteNovamente2.visible = true

func _on_RespostaCerta11_pressed(): #Resposta errada
	$TenteNovamente2.visible = true

func _on_Resposta_errada_122_pressed():#Resposta certa 2
	$DesafioMat4.visible = false
	$DesafioMat5.visible = true

func _on_TentarDenovo2_pressed(): #Resposta errada
	$TenteNovamente2.visible = false

func _on_RespostaErrada212_pressed():#Resposta certa 2
	$DesafioMat5.visible = false
	$DesafioMat6.visible = true
	
func _on_Resposta_errada_222_pressed(): #Resposta errada
	$TenteNovamente2.visible = true

func _on_RespostaCerta22_pressed(): #Resposta errada
	$TenteNovamente2.visible = true
	

