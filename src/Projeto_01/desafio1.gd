extends Node2D

var interfaceg = preload("res://Cenas/interface.tscn").instance()

func _ready():
	get_tree().current_scene.add_child(interfaceg)
