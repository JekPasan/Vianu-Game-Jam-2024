extends Node2D

@onready var textbox: Node2D = $"Text Box"
var nr_replicii = 1
var se_vorbeste = true

func _ready():
	pass

func _process(_delta):
	if nr_replicii == 3:
		$"Text Box2".incepe = true
	elif nr_replicii == 6:
		$"Text Box3".incepe = true
	elif nr_replicii == 7:
		se_vorbeste = false

func _input(event):
	if se_vorbeste and event.is_action_just_pressed("textbox_next"):
		nr_replicii += 1
