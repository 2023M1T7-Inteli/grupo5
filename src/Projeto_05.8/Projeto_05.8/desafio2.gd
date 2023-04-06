extends Node2D
#Declaração de variáveis.
onready var pontoSom2 = $pontoSom2
onready var somCena = $somCena



#Função que processa constantemente quando o mapa carregado.
func _process(delta):
	$ColorRect2/pontos.text = String(Global.pontos)

#Função que coleta a SAL-GEMA
func _on_coletavel1_body_entered(body):
		$coletavel1.queue_free()
		Global.pontos = Global.pontos + 1
		pontoSom2.play()
		yield(get_tree().create_timer(0.2), "timeout")
		pontoSom2.stop()
	
#Função que coleta a SAL-GEMA
func _on_coletavel2_body_entered(body):
	$coletavel2.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom2.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom2.stop()

#Função que coleta a SAL-GEMA
func _on_coletavel3_body_entered(body):
	$coletavel3.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom2.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom2.stop()

#Função que coleta a SAL-GEMA
func _on_coletavel4_body_entered(body):
	$coletavel4.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom2.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom2.stop()
	get_tree().change_scene("res://Cenas/cenafinal.tscn")

#Função que coleta a SAL-GEMA
func _on_coletavel5_body_entered(body):
	$coletavel5.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom2.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom2.stop()
	
#Função que coleta a SAL-GEMA
func _on_coletavel6_body_entered(body):
	$coletavel6.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom2.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom2.stop()
	
#Função que coleta a SAL-GEMA
func _on_coletavel7_body_entered(body):
	$coletavel7.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom2.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom2.stop()
	
#Função que coleta a SAL-GEMA
func _on_coletavel8_body_entered(body):
	$coletavel8.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom2.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom2.stop()
	
#Função que coleta a SAL-GEMA
func _on_coletavel9_body_entered(body):
	$coletavel9.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom2.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom2.stop()
	
#Função que coleta a SAL-GEMA
func _on_coletavel10_body_entered(body):
	$coletavel10.queue_free()
	Global.pontos = Global.pontos + 1
	pontoSom2.play()
	yield(get_tree().create_timer(0.2), "timeout")
	pontoSom2.stop()

func _on_botaoContinuar_pressed():
	$tutorialDesafio2.visible = false
	$bonecoteste.visible = true
