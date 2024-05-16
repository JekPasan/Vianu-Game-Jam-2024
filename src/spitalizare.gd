extends Node2D

@onready var tburi = $conversatie.get_children()
@onready var tburi2 = $conversatie2.get_children()
@onready var decizie = $decizie.get_children()
@onready var tburi3a = $conversatie3a.get_children()
@onready var tburi3b = $conversatie3b.get_children()
var ruta = ""
var tmp = ""
var timeskip = false

func _ready():
	$AnimationPlayer.play("trezire")
	$AnimationPlayer.animation_finished.connect(incepe_dialog)
	print(tburi)
	$decizie/renunta.pressed.connect(renunta)
	$decizie/continua.pressed.connect(continua)
	$decizie/renunta.disabled = true
	$decizie/continua.disabled = true

func _process(_delta):
	if is_instance_valid(tburi[-1]):
		#var i = 0
		#while i < len(tburi):
			#if not is_instance_valid(tburi[i]) and is_instance_valid(tburi[i+1]):
				#tburi[i+1].start()
			#i += 1
		Conversatie.start(tburi)
	elif not timeskip:
		timeskip = true
		$AnimationPlayer.play("timeskip")
	elif is_instance_valid(tburi2[-1]) and timeskip:
		Conversatie.start(tburi2)
	elif not is_instance_valid(tburi2[-1]) and ruta == "":
		$decizie/renunta.disabled = false
		$decizie/continua.disabled = false
		$AnimationPlayer.play("decizie")
		ruta = " "
	elif ruta == "c":
		$AnimationPlayer.play("fadeout")
	elif not(is_instance_valid(tburi3a[0])) or not(is_instance_valid(tburi3b[0])):
		ruta = "c"
		#print(is_instance_valid(tburi3a[0]), " ", is_instance_valid(tburi3b[0]), " ", not(is_instance_valid(tburi3a[0])), " ", not(is_instance_valid(tburi3b[0])))
	elif ruta == "a" and is_instance_valid(tburi3a[0]):
		tburi3a[0].start()
	elif ruta == "b" and is_instance_valid(tburi3b[0]):
		tburi3b[0].start()

func incepe_dialog(anim_name):
	if anim_name == "trezire":
		tburi[0].start()
	elif anim_name == "timeskip":
		tburi2[0].start()
		$AudioStreamPlayer2D.play()
	elif anim_name == "decizie":
		$AnimationPlayer.stop()
	elif anim_name == "fadeout":
		if tmp == "a":
			get_tree().change_scene_to_file("res://assets/scenes/quitter_ending.tscn")
		elif tmp == "b":
			get_tree().change_scene_to_file("res://assets/scenes/tabla.tscn")

func renunta():
	ruta = "a"
	tmp = "a"
	$decizie.visible = false
	print(ruta)
	$AudioStreamPlayer2D.stop()

func continua():
	ruta = "b"
	tmp = "b"
	$decizie.visible = false
	print(ruta)
