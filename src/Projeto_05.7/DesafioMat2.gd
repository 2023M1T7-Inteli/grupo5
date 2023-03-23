extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RespostaCerta_pressed():
	get_tree().change_scene()
	
func _on_RespostaErrada1_pressed():
	get_tree().change_scene("res://Cenas/TenteNovamente.tscn")

func _on_Resposta_errada_2_pressed():
	get_tree().change_scene("res://Cenas/TenteNovamente.tscn")
