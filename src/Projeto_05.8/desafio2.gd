extends Node2D
onready var pontoSom = $pontoSom


func _ready():
	pass # Replace with function body.

func _process(delta):
	$ColorRect2/pontos.text = String(Global.pontos)

func _on_coletavel1_body_entered(body):
		$coletavel1.queue_free()
		Global.pontos = Global.pontos + 1
		yield(get_tree().create_timer(0.2), "timeout")
	
	
func _on_coletavel2_body_entered(body):
	$coletavel2.queue_free()
	Global.pontos = Global.pontos + 1
	yield(get_tree().create_timer(0.2), "timeout")



func _on_coletavel3_body_entered(body):
	$coletavel3.queue_free()
	Global.pontos = Global.pontos + 1
	yield(get_tree().create_timer(0.2), "timeout")

func _on_coletavel4_body_entered(body):
	$coletavel4.queue_free()
	Global.pontos = Global.pontos + 1
	yield(get_tree().create_timer(0.2), "timeout")


func _on_coletavel5_body_entered(body):
	$coletavel5.queue_free()
	Global.pontos = Global.pontos + 1
	yield(get_tree().create_timer(0.2), "timeout")
	

func _on_coletavel6_body_entered(body):
	$coletavel6.queue_free()
	Global.pontos = Global.pontos + 1
	
	yield(get_tree().create_timer(0.2), "timeout")
	
	
func _on_coletavel7_body_entered(body):
	$coletavel7.queue_free()
	Global.pontos = Global.pontos + 1
	
	yield(get_tree().create_timer(0.2), "timeout")
	

func _on_coletavel8_body_entered(body):
	$coletavel8.queue_free()
	Global.pontos = Global.pontos + 1
	
	yield(get_tree().create_timer(0.2), "timeout")
	

func _on_coletavel9_body_entered(body):
	$coletavel9.queue_free()
	Global.pontos = Global.pontos + 1
	
	yield(get_tree().create_timer(0.2), "timeout")
	

func _on_coletavel10_body_entered(body):
	$coletavel10.queue_free()
	Global.pontos = Global.pontos + 1

	yield(get_tree().create_timer(0.2), "timeout")
	
	
