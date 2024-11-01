extends Area2D

@onready var character = get_parent()


func _physics_process(delta: float) -> void:
	check_for_collision(delta)


func check_for_collision(delta):
	var overlapping_enemies = get_overlapping_bodies()

	if overlapping_enemies:
		take_damage(delta, overlapping_enemies)


func take_damage(delta, enemies):
	var damage_to_take = 0

	for enemy in enemies:
		if enemy.health_component.health:
			damage_to_take += enemy.DAMAGE * delta

	character.health_component.decrease_health(damage_to_take)
