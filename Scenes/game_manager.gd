extends Node

@onready var label = %Label
@onready var timer = %Timer

func _process(delta: float) -> void:
	label.text = str(floor(timer.time_left))
	
