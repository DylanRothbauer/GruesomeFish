extends Area2D

@onready var timer = $Timer
@onready var animation = $AnimatedSprite2D2


func _on_body_entered(body: Node2D) -> void:
	# Play animation
	animation.play("BLOOD")
	
	# Add time for eating human


func _on_animated_sprite_2d_2_animation_finished() -> void:
	# Kill player
	queue_free()
