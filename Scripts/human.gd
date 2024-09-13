extends Area2D

@onready var timer = get_node("/root/Game/Timer")
@onready var animationHuman = $AnimatedSprite2D2
@onready var animationShark = get_node("/root/Game/Shark/AnimatedSprite2D")
var xScale = 1
var yScale = 1
var scalar = .5 # Can adjust this when we refine/polish

func _on_body_entered(body: Node2D) -> void:
	# Play animation
	animationHuman.play("BLOOD")
	
	# Add time for eating human
	var timeLeft = timer.get_time_left()
	# timer.set_wait_time(timeLeft + 3.00)
	timer.start(timeLeft + 3.00)
	
	# Increase size of shark
	animationShark.set_scale(Vector2(xScale + scalar,yScale + scalar))

func _on_animated_sprite_2d_2_animation_finished() -> void:
	# Kill player
	queue_free()
