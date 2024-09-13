extends Area2D

@onready var timer = get_node("/root/Game/Timer")
@onready var animationHuman = $AnimatedSprite2D2
@onready var animationShark = get_node("/root/Game/Shark/AnimatedSprite2D")
@onready var arm_scene = preload("res://Scenes/Arm.tscn")
var xScale = 1
var yScale = 1
var scalar = 0.5 # Can adjust this when we refine/polish

func _on_body_entered(body: Node2D) -> void:
	# Play animation
	print("ATE SOMETHING")
	animationHuman.play("BLOOD")
	
	# Add time for eating human
	var timeLeft = timer.get_time_left()
	timer.start(timeLeft + 3.0)
	
	# Increase size of shark
	animationShark.set_scale(Vector2(xScale + scalar, yScale + scalar))
	
	# Spawn arm (instancing the scene)
	var arm = arm_scene.instantiate()
	get_parent().add_child(arm)
	
	# Position the arm relative to the human
	arm.position = self.position
	
	# Set the arm to move in a random direction
	var random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * randf_range(100, 200)
	arm.set("random_direction", random_direction) # Pass the random direction to the arm

func _on_animated_sprite_2d_2_animation_finished() -> void:
	# Kill player
	queue_free()
