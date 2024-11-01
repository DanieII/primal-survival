extends Node

const SPEED = 20
const MIN_DISTANCE_FROM_PLAYER = 1
@onready var character = get_node("../../Character")
@onready var enemy = get_parent()
@onready var animated_sprite = enemy.get_node("AnimatedSprite2D")


func _physics_process(delta: float) -> void:
	move_enemy()


func move_enemy():
	var direction = enemy.global_position.direction_to(character.global_position)
	var distance_to_player = enemy.global_position.distance_to(character.global_position)

	if distance_to_player <= MIN_DISTANCE_FROM_PLAYER:
		return

	animated_sprite.flip_h = character.global_position[0] < enemy.global_position[0]

	enemy.velocity = direction * SPEED
	enemy.move_and_slide()
