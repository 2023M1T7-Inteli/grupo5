extends Node2D
onready var animacaoOrienta = $"meninoorientação/AnimationPlayer"


#Aqui tem a função do botão VOLTAR no menu de orientação.
func _on_voltar_pressed():
	get_tree().change_scene("res://menu/Menu.tscn")

func _process(delta):
	animacaoOrienta.play("andandoesquerda")
