extends Button

# Load main scene when button is pressed
func _pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
