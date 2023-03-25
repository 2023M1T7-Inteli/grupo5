extends TouchScreenButton
#Declaração de variáveis.
var continuar = 1

#Função que processa constantemente quando o mapa carregado.
func _process(delta):
	while continuar == 1:
		$".".visible = false
		yield(get_tree().create_timer(1), "timeout")
		$".".visible = true
		yield(get_tree().create_timer(1), "timeout")
