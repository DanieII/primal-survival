extends Area2D

const PROJECTILE = preload("res://scenes/character/projectile.tscn")


func _physics_process(delta: float) -> void:
	look_at_closest_enemy()


func _on_timer_timeout() -> void:
	var enemies_in_range = get_alive_enemies_in_range()

	if enemies_in_range:
		shoot()


func look_at_closest_enemy():
	var alive_enemies_in_range = get_alive_enemies_in_range()

	if alive_enemies_in_range:
		var closest_enemy: CharacterBody2D = alive_enemies_in_range[0]
		look_at(closest_enemy.global_position)


func get_alive_enemies_in_range():
	var enemies_in_range = get_overlapping_bodies()
	var alive_enemies_in_range = enemies_in_range.filter(
		func(enemy): return enemy.health_component.health > 0
	)

	return alive_enemies_in_range


func shoot():
	var projectile = PROJECTILE.instantiate()

	projectile.global_position = global_position
	projectile.global_rotation = global_rotation

	add_child(projectile)
