extends Area2D

#Declaração das variaveis para diálago 
var newDialog= Dialogic.start('professora') 
var dialogoLogic= false
onready var interacao1 = $AnimationPlayer

#Função que processa quando o mapa carrega.
func _ready():
	$interacao.visible = true

#Uma função que basicamnte vai dizer TRUE quando houver contato entre os corpos de interação.
func _on_professora_body_entered(body):
	print("oi")
	dialogoLogic= true

#Uma função que vai dizer FALSE quando esses corpos saírem de interação.
func _on_professora_body_exited(body):
	dialogoLogic= false

#Função que sempre processa quando a tela carrega.
func _physics_process(delta):
	#interacao1.play("respirando")
	#Se a interação for TRUE + "E" do teclado, haverá um diálago.
	if dialogoLogic == true and Input.is_action_just_pressed("ui_e"):
		$interacao.visible = false
		add_child(newDialog)
		Global.sinal = true



