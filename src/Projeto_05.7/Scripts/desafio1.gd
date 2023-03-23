extends Node2D
onready var pontoSom = $pontoSom

#Aqui estamos colocando a tela preta no canto direito do desafio para receber os comandos.
#Declarando uma variável para a coleta do item.
#Variável para a lista de comando.
onready var musicaTocando = $musica/AudioStreamPlayer
onready var musicBotao = $buttonFx
#Quando o mapa carregar, os pontos do jogador será 0.
func _ready():
	$PreDesafio.visible = false
	$DesafioMat1.visible = false
	$DesafioMat2.visible = false
	$DesafioMat3.visible = false
	$TenteNovamente.visible = false
	$Premio.visible = false
	$dedo1.visible = false
	$dedo2.visible = false
	$garotodesafio1.visible = false
	
#Aqui tem um código que não vamos utilizar no momento, mas poderá ser útil no futuro.
#	get_tree().current_scene.add_child(interfaceg)

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
#Aqui quando pegamos os itens 1, 2 e 3 eles somem e contam 3 pontos para o jogador.
func _on_coletavel1_body_entered(body):
	Global.pontos = Global.pontos + 1
	$coletavel1.queue_free()
	pontoSom.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom.stop()
	
#Aqui quando pegamos o coletavel 4, 5 e 6 eles somem e contam mais 3 pontos para o jogador.
func _on_coletavel4_body_entered(body):
	Global.pontos = Global.pontos + 1
	$coletavel4.queue_free()
	pontoSom.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom.stop()

func _on_BotaoPausar_pressed():
	Global.pausar = true

func _on_coletavel2_body_entered(body):
	$coletavel2.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom.stop()
	
func _on_coletavel3_body_entered(body):
	$coletavel3.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom.stop()
	
func _on_coletavel5_body_entered(body):
	$coletavel5.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom.stop()

func _on_coletavel6_body_entered(body):
	$coletavel6.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom.stop()
	

func _on_continuar1_pressed():
	$Tut1.visible = false
	$Tut2.visible = true
	
	# Quando pressionado esse botão, o color rerect 1, fica invisível e o color rect 2, torna-se visível, a mesma coisa para o botão "continuar" 1 e 2

func _on_continuar2_pressed():
	$garotodesafio1.visible = true
	$Tut2.visible = false
	# Quando pressionado esse botão, o color rect 2, fica invisível
	

func _on_Bau_body_entered(body):
	if body.is_in_group("Playerdesafio"):
		$PreDesafio.visible = true
		$garotodesafio1.visible = false



func _on_RespostaCerta1_pressed():
	$DesafioMat2.visible = true
	$DesafioMat1.visible = false
	$garotodesafio1.visible = false

	

func _on_RespostaErrada11_pressed():
	$DesafioMat1.visible = false
	$TenteNovamente.visible = true
	


func _on_Resposta_errada_12_pressed():
	$DesafioMat1.visible = false
	$TenteNovamente.visible = true
	


func _on_RespostaCerta2_pressed():
	$DesafioMat2.visible = false
	$DesafioMat3.visible = true	

func _on_RespostaErrada21_pressed():
	$DesafioMat2.visible = false
	$TenteNovamente.visible = true


func _on_Resposta_errada_22_pressed():
	$DesafioMat2.visible = false
	$TenteNovamente.visible = true
	
func _on_RespostaCerta3_pressed():
	$DesafioMat3.visible = false
	$Premio.visible = true

func _on_RespostaErrada31_pressed():
	$DesafioMat3.visible = false
	$TenteNovamente.visible = true

func _on_Resposta_errada_32_pressed():
	$DesafioMat3.visible = false
	$TenteNovamente.visible = true

func _on_TentarDenovo_pressed():
	$TenteNovamente.visible = false
	$DesafioMat1.visible = true

func _on_Premio_pressed():
	$Premio.visible = false
	$Bau.visible = false
	$garotodesafio1.visible = true
	Global.pontos += 15
	
	
func _on_PreDesafio_pressed():
	$PreDesafio.visible = false
	$DesafioMat1.visible = true
