extends Node2D

#Aqui tem a função que roda assim que o mapa é carregado.
func _ready():
	$ColorRect.visible = false
	$ColorRect/Label.visible = false

#Aqui tem a função que sempre roda quando o mapa é carregado.	
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused == false:
			get_tree().paused = true
			$ColorRect.visible = true
			$ColorRect/Label.visible = true
			
		else:
			get_tree().paused = false
			$ColorRect/Label.visible = false
			$ColorRect.visible = false

#Função do botão que volta pro MENU.
func _on_Button_pressed():
	get_tree().paused = false
	$ColorRect/Label.visible = false
	$ColorRect.visible = false
	get_tree().change_scene("res://menu/Menu.tscn")

#Função que retorna para o jogo depois de pausado.
func _on_continuar_pressed():
	get_tree().paused = false
	$ColorRect/Label.visible = false
	$ColorRect.visible = false
