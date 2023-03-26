extends Node2D
onready var animacaoOrienta = $"meninoorientação/AnimationPlayer"


#Aqui tem a função do botão VOLTAR no menu de orientação.
func _on_voltar_pressed():
	yield(get_tree().create_timer(0.25), "timeout")
	get_tree().change_scene("res://menu/Menu.tscn")

#Aqui tem uma função que sempre roda quando o mapa é carregado.
func _process(delta):
	animacaoOrienta.play("andandoesquerda")
