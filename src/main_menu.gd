extends Node2D

@onready var animation_player = $AnimationPlayer
var destinatie: String

func _ready():
	var play = $"menu buttons/Play"
	play.pressed.connect(pressed_play)
	
	var quit = $"menu buttons/Quit"
	quit.pressed.connect(pressed_quit)
	
	var credits = $"menu buttons/Credits"
	credits.pressed.connect(change_menu)
	
	var back = $"credits page/Back"
	back.pressed.connect(change_menu)
	
	var librarie = $"menu buttons/Librarie"
	librarie.pressed.connect(schimb_librarie)
	
	animation_player.in_node.visible = true
	animation_player.play("in")
	
	Conversatie.resetat = false

func _process(_delta):
	pass

func pressed_play():
	animation_player.out_node.visible = true
	animation_player.play("out")
	destinatie = "joc"

func change_menu():
	$"menu buttons".visible = not($"menu buttons".visible)
	$"credits page".visible = not($"credits page".visible)

func pressed_quit():
	get_tree().quit()

func schimb_librarie():
	animation_player.out_node.visible = true
	animation_player.play("out")
	destinatie = "librarie"

func animation_finished(anim_name):
	if anim_name == "out" and destinatie == "librarie":
		get_tree().change_scene_to_file("res://assets/scenes/librarie.tscn")
	elif anim_name == "out" and destinatie == "joc":
		get_tree().change_scene_to_file("res://assets/scenes/intro.tscn")
	elif anim_name == "in":
		animation_player.in_node.visible = false
