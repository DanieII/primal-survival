extends CharacterBody2D

const DAMAGE = 25
@onready var health_component = get_node("Health")


func die():
	print("GAME OVER")
