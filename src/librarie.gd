extends Node2D

@onready var animation_player = $AnimationPlayer

func _ready():
	var back = $Back
	back.pressed.connect(inapoi)
	animation_player.in_node.visible = true
	animation_player.play("in")
	

func _process(_delta):
	pass

func inapoi():
	animation_player.out_node.visible = true
	animation_player.play("out")

func anim_finished(anim_name):
	if anim_name == "in":
		animation_player.in_node.visible = false
	elif anim_name == "out":
		get_tree().change_scene_to_file("res://assets/scenes/main_menu.tscn")
