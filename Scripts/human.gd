extends Area2D

@onready var timer = get_node("/root/Game/Timer")

@onready var animation = $AnimatedSprite2D2


func _on_body_entered(body: Node2D) -> void:
	# Play animation
	animation.play("BLOOD")
	
	# Add time for eating human
	var timeLeft = timer.get_time_left()
	# timer.set_wait_time(timeLeft + 3.00)
	timer.start(timeLeft + 3.00)

func _on_animated_sprite_2d_2_animation_finished() -> void:
	# Kill player
	queue_free()
