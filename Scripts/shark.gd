extends CharacterBody2D


const SPEED = 300.0
const DASH_MULT = 4
@onready var animatedShark = $AnimatedSprite2D
var input_direction
var dashing = false
@onready var timer = get_node("Dash Timer")

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
	# Handle player movement and dashing
	get_input()
	if dashing:
		velocity *= DASH_MULT
	move_and_slide()
	
	# Flip sprite if player goes left
	var isLeft = velocity.x < 0
	animatedShark.flip_h = !isLeft
