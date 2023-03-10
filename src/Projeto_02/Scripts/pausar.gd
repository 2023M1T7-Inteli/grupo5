extends Node2D

#TENTAR FAZER BOTÃO DE PAUSE DEPOIS
# acredito que com IF seja possível (anotação)

func _ready():
	$Label.visible = false
	
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused == false:
			get_tree().paused = true
			$Label.visible = true
			
		else:
			get_tree().paused = false
			$Label.visible = false
