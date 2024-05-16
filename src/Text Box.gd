extends Node2D

class_name TextBox

var curent = 1
@export var vorbitor: String
@export var lungime: int
@export var replici: Array[String]
@export var incepe = false

func _ready():
	lungime = len(replici)
	init_vorbitor()
	if len(replici) > 0:
		$Continut.text = replici[0]
	if not incepe:
		visible = false
	$AnimationPlayer.play("bob")

func _process(_delta):
	if incepe:
		visible = true

func _input(event):
	if event.is_action_pressed("textbox_next") and incepe:
		curent += 1
		if curent > lungime:
			self.queue_free()
		else:
			$Continut.text = replici[curent-1]

func init_vorbitor():
	$Vorbitor.text = vorbitor
	if vorbitor in Portrete.portrete:
		$Portret.texture = Portrete.portrete[vorbitor]
	else:
		$Portret.texture = Portrete.portrete["?"]

func start():
	incepe = true
