extends Node

func _input(_event: InputEvent) -> void:
	if OS.is_debug_build():
		if Input.is_action_just_pressed("quit"):
			get_tree().quit()
		
		if Input.is_action_just_pressed("capture_mouse"):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
		if Input.is_action_just_pressed("show_mouse"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
