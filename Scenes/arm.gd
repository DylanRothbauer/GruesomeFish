extends Node2D

@export var random_direction: Vector2
var speed = 100.0
var rotation_speed = 1.0

func _ready() -> void:
	# Initialize the random direction (if not already set)
	if random_direction == null:
		random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * speed

func _process(delta: float) -> void:
	# Move the arm in the random direction
	position += random_direction * delta
	
	# Rotate the arm slowly over time
	rotation += rotation_speed * delta
	
	# Remove the arm after it moves off-screen or too far
	if position.distance_to(Vector2.ZERO) > 2000:
		queue_free()
