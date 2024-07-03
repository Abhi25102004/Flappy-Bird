extends CharacterBody2D

var speed_in_y_jump : int = -3500
var speed_in_y : int = 112
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _physics_process(_delta: float) -> void:
	velocity.y = speed_in_y 
	if Input.is_action_just_pressed("Space"):
		velocity.y = speed_in_y_jump
	move_and_slide()
