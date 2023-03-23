extends Area2D

#Declaração das variaveis para diálago 
var newDialog= Dialogic.start('pescador') 
var dialogoLogic= false
var i = false

func _ready():
	$"../interagir".visible = true

#Basicamente aqui é o que acontece quando há interação entre os corpos.
func _physics_process(delta):
	#Se a interação for TRUE + "E" do teclado, haverá um diálago.
	if dialogoLogic == true and Input.is_action_just_pressed("ui_e"):
		$"../interagir".visible = false
		add_child(newDialog)
		$"../jangadacommenino".position.x = 158
		$"../jangadacommenino".position.y = 78
		$"../jangadacommenino".visible = true
		$"../personagemoficial".visible = false
		$"../JangadaLado2".visible = false

#Uma função que basicamnte vai dizer TRUE quando houver contato entre os corpos de interação.
func _on_areapescador_body_entered(body):
		dialogoLogic= true

#Uma função que vai dizer FALSE quando esses corpos saírem de interação.
func _on_areapescador_body_exited(body):
	dialogoLogic= false
