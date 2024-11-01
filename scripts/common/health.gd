extends Node

@export var health = 0
@onready var body = get_parent()
@onready var animated_sprite = body.get_node("AnimatedSprite2D")


func decrease_health(value):
	if not value:
		return

	health -= value
	health = max(health, 0)

	indicate_damage()

	if health == 0:
		body.die()


func indicate_damage():
	var damaged_animation_timer = get_node("DamagedAnimationTimer")

	if damaged_animation_timer:
		# Restart timer
		damaged_animation_timer.start()
	else:
		# Create timer
		damaged_animation_timer = Timer.new()
		damaged_animation_timer.name = "DamagedAnimationTimer"
		damaged_animation_timer.wait_time = 0.3
		damaged_animation_timer.one_shot = true
		add_child(damaged_animation_timer)
		damaged_animation_timer.start()

		damaged_animation_timer.connect("timeout", stop_animation)

	animated_sprite.modulate = Color(1, 1, 1, 0.5)


func stop_animation():
	animated_sprite.modulate = Color(1, 1, 1)
	get_node("DamagedAnimationTimer").queue_free()
