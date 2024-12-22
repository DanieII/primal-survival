extends Path2D

const SPAWN_AREA_WIDTH = 250
const SPAWN_AREA_HEIGHT = 400
const WORLD_MIN_POSITION = -450
const WORLD_MAX_POSITION = 470
@onready var enemy_scenes = get_enemy_scenes()
@onready var game = get_node("/root/Game")


func get_enemy_scenes():
	const path = "res://scenes/enemies/enemy_types/"
	var dir = DirAccess.open(path)
	var scenes = []

	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()

		while file_name != "":
			var scene_path = path + file_name
			var enemy_scene = load(scene_path)
			scenes.append(enemy_scene)

			file_name = dir.get_next()

	return scenes


func _on_spawn_timer_timeout() -> void:
	spawn_enemy()


func spawn_enemy():
	var enemy_scene = enemy_scenes[randi() % enemy_scenes.size()]
	var enemy = enemy_scene.instantiate()
	enemy.global_position = get_enemy_position()

	game.add_child(enemy)


func get_enemy_position():
	$EnemySpawnLocation.progress_ratio = randf()
	var enemy_position = $EnemySpawnLocation.global_position

	# Make sure position is in world bounds
	enemy_position = get_position_in_world_bounds(enemy_position)

	return enemy_position


func get_position_in_world_bounds(enemy_position):
	if enemy_position.x > WORLD_MAX_POSITION:
		enemy_position.x -= SPAWN_AREA_WIDTH
	elif enemy_position.x < WORLD_MIN_POSITION:
		enemy_position.x += SPAWN_AREA_WIDTH

	if enemy_position.y > WORLD_MAX_POSITION:
		enemy_position.y -= SPAWN_AREA_HEIGHT
	elif enemy_position.y < WORLD_MIN_POSITION:
		enemy_position.y += SPAWN_AREA_HEIGHT

	return enemy_position
