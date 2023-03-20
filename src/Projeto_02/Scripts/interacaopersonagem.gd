extends Node2D

#Declaração das variaveis para diálago 
var newDialog= Dialogic.start('teste') 
var dialogoLogic= false 


#Uma função que basicamnte vai dizer TRUE quando houver contato entre os corpos de interação.
func _on_Area2D_body_entered(body):
	dialogoLogic= true

#Uma função que vai dizer FALSE quando esses corpos saírem de interação.
func _on_Area2D_body_exited(body):
	dialogoLogic= false

#Basicamente aqui é o que acontece quando há interação entre os corpos.
func _physics_process(delta):
	#Se a interação for TRUE + "E" do teclado, haverá um diálago.
	if dialogoLogic == true and Input.is_action_just_pressed("ui_e"):
		add_child(newDialog)
		
		
