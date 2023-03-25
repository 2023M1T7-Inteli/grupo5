extends Area2D
#Declaraçã0o de variáveis.
var saida: bool = false

#Função da interação quando dois corpos se encontram.
func _on_saida_body_entered(body):
		if body.is_in_group("Playerdesafio"):
			saida = true
			queue_free()
			get_tree().change_scene("res://cena2.tscn")

