extends Camera3D

@export var pivot : Node3D

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		# Clamp horizontal rotation (pivot) so you can't look behind
		var new_yaw = pivot.rotation.y - event.relative.x * settings_data.SENSITIVITY
		new_yaw = clamp(new_yaw, deg_to_rad(0), deg_to_rad(180)) # adjust range as needed
		pivot.rotation.y = new_yaw

		# Clamp vertical rotation (camera)
		rotate_x(-event.relative.y * settings_data.SENSITIVITY)
		rotation.x = clamp(rotation.x, deg_to_rad(-40), deg_to_rad(70))
