extends Node2D

# tburi = prescurtare pentru textbox-uri
@onready var tburi: Array = $conversatie.get_children()
var trezit = false

func _ready():
	$Timer.timeout.connect(incepe)
	print(tburi)

func _process(_delta):
	if not is_instance_valid(tburi[0]) and not trezit:
		$AnimationPlayer.play("trezirea")
		trezit = true
	
	if not is_instance_valid(tburi[-1]):
		$AnimationPlayer.play("adormire")
		$ColorRect.visible = true
	else:
		var i = len(tburi)-1
		while i > -1:
			if not is_instance_valid(tburi[i]) and is_instance_valid(tburi[i+1]) and i != 0:
				tburi[i+1].start()
			i -= 1

func incepe():
	tburi[0].start()
	$Timer.queue_free()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "trezirea":
		tburi[1].start()
		$AnimationPlayer.stop()
		$ColorRect.visible = false
	elif anim_name == "adormire":
		get_tree().change_scene_to_file("res://assets/scenes/spitalizare.tscn")
