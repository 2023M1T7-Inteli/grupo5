extends Node2D

var interfaceg = preload("res://Cenas/interface.tscn").instance()
var coletavel1 = false

func _ready():
	Global.pontos = 0
	print(Global.pontos)
#	get_tree().current_scene.add_child(interfaceg)
	
func _process(delta):
	$ColorRect/pontosnume.text = String(Global.pontos)

func _on_coletavel1_body_entered(body):
	Global.pontos = Global.pontos + 3
	$coletavel1.hide()
	$coletavel2.hide()
	$coletavel3.hide()
	
#func _on_coletavel2_body_entered(body):
#	$coletavel2.hide()
#
#func _on_coletavel3_body_entered(body):
#	Global.pontos = Global.pontos + 3
#	$coletavel3.hide()

func _on_coletavel4_body_entered(body):
	Global.pontos = Global.pontos + 3
	$coletavel4.hide()
	$coletavel5.hide()
	$coletavel6.hide()
