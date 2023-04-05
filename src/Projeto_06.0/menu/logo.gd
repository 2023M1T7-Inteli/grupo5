extends Sprite
var velocidade = 10
var tempo = 1

func _process(delta):
	if tempo == 1:
		while tempo == 1:
			move_local_y(velocidade * delta)
			yield(get_tree().create_timer(1), "timeout")
			tempo = 0
			
	elif tempo == 0:
		while tempo == 0:
			move_local_y(-velocidade * delta)
			yield(get_tree().create_timer(1), "timeout")
			tempo = 1
