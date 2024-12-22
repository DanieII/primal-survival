extends CharacterBody2D

const DAMAGE = 25
@onready var health_component = get_node("Health")


func _ready():
	pass


func die():
	GameManager.game_over()
