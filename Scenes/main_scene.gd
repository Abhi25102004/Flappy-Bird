extends Node2D
@onready var label_2: Label = $Label2

func _ready() -> void:
	label_2.text = "Score : " + str(Global.score)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_scene.tscn")
