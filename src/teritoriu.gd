extends Node2D

@export_enum("M", "B", "O", "S", ".") var tip
var tipuri = ["M", "B", "O", "S", "."]

func _ready():
	pass

func este_special():
	return tip == 1 or tip == 2 or tip == 3

func _process(_delta):
	if tip == 0:
		$Sprite2D.texture = preload("res://assets/img/mihai viteazul.jpg")
	elif tip == 1:
		$Sprite2D.texture = preload("res://assets/img/flag-tile.png")
	elif tip == 2:
		$Sprite2D.texture = preload("res://assets/img/obstacle-tile.png")
	elif tip == 3:
		$Sprite2D.texture = preload("res://assets/img/flee-tile.png")
	elif tip == 4:
		$Sprite2D.texture = preload("res://assets/img/grass-tile.png")
