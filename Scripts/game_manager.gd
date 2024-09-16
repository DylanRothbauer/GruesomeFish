extends Node

@onready var label = %Label
@onready var timer = %Timer

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")


func _on_timer_ready() -> void:
	pass # Replace with function body.

func _delta_process() -> void:
	label.text = str(floor(timer.time_left))
