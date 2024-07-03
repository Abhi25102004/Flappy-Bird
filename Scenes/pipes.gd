extends CharacterBody2D

var speed : int = 300
var change_scene : bool = false
var clifs_image : Array = [preload("res://Sprites/0.png"),preload("res://Sprites/1.png")]
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite_2d.texture = clifs_image.pick_random()

func _physics_process(_delta: float) -> void:
	velocity.x = -1 * speed
	move_and_slide()
	
	if change_scene:
		get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
	
	if global_position.x <= -90:
		Global.score += 1
		queue_free()

func _on_area_2d_body_entered(_body: CharacterBody2D) -> void:
	change_scene = true
