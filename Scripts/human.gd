extends Area2D

@onready var timer = get_node("/root/Game/Timer")
@onready var animationHuman = $AnimatedSprite2D2
@onready var animationShark = get_node("/root/Game/Shark/AnimatedSprite2D")
@onready var arm_scene = preload("res://Scenes/Arm.tscn")
var human_scene = preload("res://Scenes/human.tscn")
var xScale = 1
var yScale = 1
var scalar = 0.5 # Can adjust this when we refine/polish
var count = 0
var speed = 10
var shark_chase = false
var shark = null
var human_exists = true

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
	human_exists = false

func _on_animated_sprite_2d_2_animation_finished() -> void:
	# Kill player
	queue_free()


func _on_detection_area_body_entered(body: Node2D) -> void:
	shark = body
	shark_chase = true
	count = count+1


func _on_detection_area_body_exited(body: Node2D) -> void:
	shark = null
	shark_chase = false 

func _physics_process(delta):
	if shark_chase and count <= 2:
		position += (shark.position + position)/speed
		
#respawn code - to be fixed.
#func _process(delta):
	#if shark != null:
		#var new_obj = human_scene.instantiate()
		#new_obj.position = position
		#get_parent().add_child(new_obj)
		#shark = new_obj

 
func _process(delta: float) -> void:
	if not human_exists:
		# Feel free to adjust ranges
		var random_x = randf_range(10, 500)
		var random_y = randf_range(10, 500)
		var new_human = human_scene.instantiate()
		new_human = position
		get_parent().add_child(new_human)
		new_human.position = self.position
		new_human.position.x = random_x
		new_human.position.y = random_y
		human_exists = true
