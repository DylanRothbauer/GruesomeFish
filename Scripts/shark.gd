extends CharacterBody2D


const SPEED = 300.0
const WET_MULT = 2
const DASH_MULT = 4
@onready var animatedShark = $AnimatedSprite2D
var input_direction
var dashing = false
@onready var timer = get_node("Dash Timer")
@onready var wet_timer = get_node("Wet Timer")
@onready var is_wet = false

func get_input():
	input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED


func _input(event):
	if event.is_action_pressed("lunge"):
		dashing = true
		timer.wait_time = 0.25
		timer.start()
		timer.connect("timeout", _on_timer_timeout)


func _on_timer_timeout() -> void:
	dashing = false


func _physics_process(delta: float) -> void:
	# Handle player movement, dashing, and wet speed boost
	get_input()
	if is_wet:
		velocity *= WET_MULT
	if dashing:
		velocity *= DASH_MULT
	move_and_slide()
	
	# Flip sprite if player goes left
	var isLeft = velocity.x < 0
	animatedShark.flip_h = !isLeft
	
	# Set sprite based on wetness and if it's moving
	if is_wet:
		if velocity > Vector2(0, 0) or velocity < Vector2(0, 0):
			animatedShark.play("WetMoving") 
		else:
			animatedShark.play("WetDefault")
	else:
		if velocity > Vector2(0, 0) or velocity < Vector2(0, 0):
			animatedShark.play("DryMoving")
		else:
			animatedShark.play("DryDefault")
	

func _on_wet_timer_timeout() -> void:
	is_wet = false


func _on_human_2_body_entered(body: Node2D) -> void:
	is_wet = true
	wet_timer.start(3.0)
