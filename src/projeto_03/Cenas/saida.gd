extends Area2D
var saida: bool = false



func _on_saida_body_entered(body):
		if body.is_in_group("Playerdesafio"):
			body.saida = true
			queue_free()
			get_tree().change_scene("res://cena2.tscn")

