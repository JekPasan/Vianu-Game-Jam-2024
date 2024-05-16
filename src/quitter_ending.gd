extends Node2D

@onready var concluzie = $"1"

func _ready():
	$Timer.timeout.connect(incepe)

func _process(_delta):
	if not is_instance_valid(concluzie):
		get_tree().change_scene_to_file("res://assets/scenes/main_menu.tscn")

func incepe():
	if is_instance_valid(concluzie):
		concluzie.start()
	$Timer.stop()
