extends Node2D
var i = 0

func _ready():
	$ponto.visible = false
	$coletou.visible = false

func _process(delta):
	if Global.sinal == true:
		$coletou.visible = true
		$ponto.visible = true
		$ponto.text = String(Global.pontos)
		i = 1
		
	if i == 1:
		$coletou.visible = false
		$ponto.visible = false
		yield(get_tree().create_timer(1), "timeout")
		$coletou.visible = true
		$ponto.visible = true
		yield(get_tree().create_timer(1), "timeout")
