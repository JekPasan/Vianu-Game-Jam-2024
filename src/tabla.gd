extends Node2D

var spatii_castigate = 1
var poz: Vector2
var prev_poz: Vector2
var inceput = false
var miscari = 5
var steaguri = 0
var total = 0
var gol = 1
@onready var randuri = $R.get_children()
@onready var tburi = $replici.get_children()

func _ready():
	$AnimationPlayer.play("fadein")
	$AnimationPlayer.animation_finished.connect(anim_finished)
	for i in range(len(randuri)):
		var spatii = randuri[i].get_children()
		for j in range(len(spatii)):
			if spatii[j].tip == 0:
				poz = Vector2(j, i)
				prev_poz = poz
	inceput = Conversatie.resetat

func _process(_delta):
	if is_instance_valid(tburi[-1]):
		Conversatie.start(tburi)
	else:
		inceput = true
	if miscari < 0:
		$ColorRect.visible = true
		$AnimationPlayer.play("fadeout")
		inceput = false
	$RichTextLabel.text = "Mișcări: " + str(miscari)
	for i in range(len(randuri)):
		var spatii = randuri[i].get_children()
		for j in range(len(spatii)):
			if j == poz.x and i == poz.y:
				spatii[j].tip = 0
			elif not spatii[j].este_special():
				spatii[j].tip = 4

func _input(event):
	var t = true
	if inceput:
		if event.is_action_pressed("ui_down") and poz.y != 4:
			prev_poz = poz
			poz.y += 1
			verifica(t)
		elif event.is_action_pressed("ui_up") and poz.y != 0:
			prev_poz = poz
			poz.y -= 1
			verifica(t)
		elif event.is_action_pressed("ui_right") and poz.x != 4:
			prev_poz = poz
			poz.x += 1
			verifica(t)
		elif event.is_action_pressed("ui_left") and poz.x != 0:
			prev_poz = poz
			poz.x -= 1
			verifica(t)
	if event.is_action_pressed("Reload"):
		get_tree().reload_current_scene()
		Conversatie.resetat = true

func verifica(t):
	for i in range(len(randuri)):
		for j in range(len(randuri[i].get_children())):
			var spatiu = randuri[i].get_children()[j]
			if poz == Vector2(j, i) :
				if spatiu.tip == 2:
					poz = prev_poz
					miscari += 1
				elif spatiu.tip == 1:
					steaguri += 1
				elif spatiu.tip == 3 and steaguri == gol:
					get_tree().change_scene_to_file("res://assets/scenes/tabla2.tscn")
				elif spatiu.tip == 3 and steaguri != gol:
					poz = prev_poz
					miscari += 1
			elif t:
				miscari -= 1
				t = false

func anim_finished(anim_name):
	if anim_name == "fadein":
		$ColorRect.visible = false
		if not Conversatie.resetat:
			tburi[0].start()
	elif anim_name == "fadeout":
		get_tree().change_scene_to_file("res://assets/scenes/pierdut.tscn")
