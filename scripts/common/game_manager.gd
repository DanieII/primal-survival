extends Node

var is_game_started = true


func game_over():
	is_game_started = false
	get_node("/root/Game/GameOver").show()
	get_tree().paused = true


func restart_game():
	is_game_started = true
	get_node("/root/Game/GameOver").hide()
	get_tree().paused = false
	get_tree().reload_current_scene()
