extends Node2D

@onready var tb = $"Text Box"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.in_node.visible = true
	$AnimationPlayer.play("in")
	$VideoStreamPlayer.play()
	
	$fadeout.animation_finished.connect(next)

func _process(_delta):
	if not is_instance_valid(tb):
		$fadeout/ColorRect.visible = true
		$fadeout.play("fadeout")

func _on_animation_player_animation_finished(anim_name):
	$AnimationPlayer.in_node.visible = false
	$"Text Box".incepe = true

func next(_anim_name):
	get_tree().change_scene_to_file("res://assets/scenes/trezire.tscn")
