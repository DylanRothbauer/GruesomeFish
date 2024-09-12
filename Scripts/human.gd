extends Area2D

@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	# Add time for eating human
	
	queue_free()
