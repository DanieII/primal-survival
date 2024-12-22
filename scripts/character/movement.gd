extends Node

const SPEED = 50
@onready var character: CharacterBody2D = get_parent()
@onready var animated_sprite = character.get_node("AnimatedSprite2D")
@onready var health_component = get_parent().get_node("Health")


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	set_animation(direction)
	move_character(direction)


func set_animation(direction):
	animated_sprite.flip_h = direction[0] < 0

	if direction:
		animated_sprite.animation = "moving"
	else:
		animated_sprite.animation = "idle"


func move_character(direction):
	character.velocity = direction * SPEED
	character.move_and_slide()
