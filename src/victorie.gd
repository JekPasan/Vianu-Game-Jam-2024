extends Node2D

@onready var tb = $"1"

func _ready():
	$AnimationPlayer.play("fadein")

func _process(delta):
	if not is_instance_valid(tb):
		$AnimationPlayer.play("fadeout")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadein":
		if is_instance_valid(tb):
			tb.start()
	elif anim_name == "fadeout":
		get_tree().change_scene_to_file("res://assets/scenes/main_menu.tscn")
