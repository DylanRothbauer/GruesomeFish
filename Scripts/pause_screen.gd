extends ColorRect


var paused = false

# Pull up pause screen and stop time
func pause() -> void:
	paused = !paused
	get_tree().paused = paused
	visible = paused


func _input(event):
	if event.is_action_pressed("Pause"):
		pause()
