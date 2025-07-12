extends Node3D

@export var swing : Node3D
@export var camera_pivot : Node3D
@export var camera_pos : Node3D
@export var dialogue_interface : Control
@export var dialogue_timeline : AnimationPlayer
@export var option_layer : CanvasLayer
@export var black_fade_out : ColorRect
@export var buttons : Control

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	start_game()

func start_game():
	swing.swing()
	dialogue_timeline.play(&"main")

func _process(_delta: float) -> void:
	camera_pos.global_position = swing.camera_pos_ref.global_position

func display_message(number : int):
	if number == 1:
		dialogue_interface.display_text("It's still here…", 1.0)
	elif number == 2:
		dialogue_interface.display_text("I haven't been here in years...", 2.0)
	elif number == 3:
		dialogue_interface.display_text("We used to come after school… you hated the rain.", 2.5)
	elif number == 4:
		dialogue_interface.display_text("But you always stayed. Even when I didn’t say a word.", 2.5)
	elif number == 5:
		dialogue_interface.display_text("I should’ve said something.", 1.4)
	elif number == 6:
		dialogue_interface.display_text("I didn’t think that would be the last time.", 2.3)
	elif number == 7:
		dialogue_interface.display_text("I came back to remember...", 1.0)



func fade_out_and_show_options():
	option_layer.show()
	black_fade_out.show()
	black_fade_out.modulate = Color(1, 1, 1, 0)
	
	var tween = get_tree().create_tween()
	tween.connect("finished", show_mouse)
	tween.tween_property(black_fade_out, "modulate", Color(1, 1, 1, 1), 1.0)
	tween.tween_interval(2.0)
	tween.tween_property(buttons, "visible", true, 0.0)

func show_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
