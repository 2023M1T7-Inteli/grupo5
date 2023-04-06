extends TouchScreenButton

var continuar = 1

func _process(delta):
	while continuar == 1:
		$".".visible = false
		yield(get_tree().create_timer(1), "timeout")
		$".".visible = true
		yield(get_tree().create_timer(1), "timeout")
