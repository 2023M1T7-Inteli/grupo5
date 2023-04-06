extends Node2D
var interfaceg = preload("res://Cenas/interface.tscn").instance()
var coletavel1 = false

func _ready():
	get_tree().current_scene.add_child(interfaceg)
	
func _process(delta):
	$ColorRect/pontosnume.text = "" +String(Global.pontos)

func _on_coletavel1_body_entered(body):
	$coletavel1.hide()


func _on_coletavel2_body_entered(body):
	$coletavel2.hide()


func _on_coletavel3_body_entered(body):
	$coletavel3.hide()
	Global.pontos = 3
