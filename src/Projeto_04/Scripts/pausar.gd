extends Node2D

#TENTAR FAZER BOTÃO DE PAUSE DEPOIS
# acredito que com IF seja possível (anotação)

#Aqui iniciamos o jogo com o botão de pausar como FALSE.
func _ready():
	$ColorRect.visible = false
	$Label.visible = false

#Aqui tem o código do menu de PAUSE.	
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused == false:
			get_tree().paused = true
			$ColorRect.visible = true
			$Label.visible = true
			
		else:
			get_tree().paused = false
			$Label.visible = false
			$ColorRect.visible = false
