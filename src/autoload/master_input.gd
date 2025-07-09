extends Node

func _input(event: InputEvent) -> void:
	if OS.is_debug_build():
		if Input.is_action_just_pressed("quit"):
			get_tree().quit()
