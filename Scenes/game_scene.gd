extends Node2D

var clif_scene : PackedScene = preload("res://Scenes/pipes.tscn")
var rotate_angle : Array = [0,180]
@onready var timer: Timer = $Timer
@onready var clifs_nodes: Node2D = $clifs_nodes
@onready var down_marker: Marker2D = $markers/down_marker
@onready var up_marker: Marker2D = $markers/up_marker
@onready var label: Label = $Label

func _ready() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	var clifs : CharacterBody2D = clif_scene.instantiate()
	randomize()
	clifs.rotation_degrees = rotate_angle.pick_random()
	match  clifs.rotation_degrees:
		0.0:
			clifs.position = down_marker.global_position
		180.0:
			clifs.position = up_marker.global_position
	clifs.scale.y = randf_range(1,2)
	clifs_nodes.add_child(clifs)
	timer.start()
	label.text = "Score : " + str(Global.score)
