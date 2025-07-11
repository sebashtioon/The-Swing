extends Node3D

@export var swing : Node3D
@export var camera_pivot : Node3D
@export var camera_pos : Node3D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	start_game()

func start_game():
	swing.swing()
	$camera_pos/camera_pivot/main_camera/MainLayer/DialogueInterface.display_text("I haven’t been here in years…", 2.0)

func _process(_delta: float) -> void:
	camera_pos.global_position = swing.camera_pos_ref.global_position
