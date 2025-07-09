extends Camera3D

@export var pivot : Node3D

func _unhandled_input(event): # A built-in function that listens for input all the time
	if event is InputEventMouseMotion: # if the input is a mouse motion event
		pivot.rotate_y(-event.relative.x * settings_data.SENSITIVITY) # rotate the head on the y-axis
		rotate_x(-event.relative.y * settings_data.SENSITIVITY) # rotate the camera on the x-axis
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90)) # clamp the camera rotation on the x-axis
