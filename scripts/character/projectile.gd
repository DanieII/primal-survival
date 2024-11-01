extends Area2D

const SPEED = 200
@onready var character = get_parent().get_parent()


func _physics_process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * SPEED * delta


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	body.health_component.decrease_health(character.DAMAGE)
