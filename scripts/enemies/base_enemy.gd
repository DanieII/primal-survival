extends CharacterBody2D

const DAMAGE = 10
@onready var health_component = get_node("Health")


func die():
	queue_free()
