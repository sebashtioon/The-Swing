extends Node3D

@onready var vhs_shader_mat = preload("uid://bn2fftbpm7rpw")

@export var swing : Node3D
@export var camera_pivot : Node3D
@export var camera_pos : Node3D
@export var dialogue_interface : Control
@export var dialogue_timeline : AnimationPlayer
@export var option_layer : CanvasLayer
@export var black_fade_out : ColorRect
@export var buttons : Control

var can_blink : bool = false
var times_blinked : int = 0
var showing_figure : bool = false
var can_show_figure : bool = false
var shown_figure_already : bool = false

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	title_screen()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("blink"):
		blink()

func _process(_delta: float) -> void:
	camera_pos.global_position = swing.camera_pos_ref.global_position

func title_screen():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func start_game():
	can_blink = true
	swing.swing()
	dialogue_timeline.play(&"main")
	$"non-physical/FigureTimer".start()

func blink():
	if can_blink:
		times_blinked += 1
		$camera_pos/camera_pivot/main_camera/MainLayer/BlinkAnimation.play(&"main")

func show_or_hide_figure():
	if showing_figure:
		$main/figure.hide()
		showing_figure = false
		shown_figure_already = true
	
	elif times_blinked > 4 and can_show_figure and !shown_figure_already:
		$main/figure.show()
		showing_figure = true


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
	tween.connect("finished", after_fade)
	tween.tween_property(black_fade_out, "modulate", Color(1, 1, 1, 1), 1.0)
	tween.tween_interval(2.0)
	tween.tween_property(buttons, "visible", true, 0.0)

func after_fade():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_stay_button_pressed() -> void:
	buttons.hide()
	await get_tree().create_timer(3.0).timeout
	$camera_pos/camera_pivot/main_camera/OptionLayer/SeeYouAgain.show()
	await get_tree().create_timer(5.0).timeout
	$camera_pos/camera_pivot/main_camera/OptionLayer/SeeYouAgain.hide()
	await get_tree().create_timer(3.0).timeout
	$camera_pos/camera_pivot/main_camera/CreditsLayer.show()

func _on_leave_button_pressed() -> void:
	buttons.hide()
	await get_tree().create_timer(3.0).timeout
	$camera_pos/camera_pivot/main_camera/OptionLayer/Goodbye.show()
	await get_tree().create_timer(5.0).timeout
	$camera_pos/camera_pivot/main_camera/OptionLayer/Goodbye.hide()
	await get_tree().create_timer(3.0).timeout
	$camera_pos/camera_pivot/main_camera/CreditsLayer.show()


func _on_figure_timer_timeout() -> void:
	can_show_figure = true


#region Menu Buttons

func _on_sit_down_button_focus_entered() -> void:
	$camera_pos/camera_pivot/main_camera/TitleScreenLayer/SitDownLabel.modulate = Color(0.478, 0.478, 0.478)

func _on_sit_down_button_focus_exited() -> void:
	$camera_pos/camera_pivot/main_camera/TitleScreenLayer/SitDownRightArrow.modulate = Color(0.839, 0.839, 0.839)

func _on_sit_down_button_button_up() -> void:
	pass # Replace with function body.

func _on_sit_down_button_button_down() -> void:
	pass # Replace with function body.



func _on_leave_button_focus_entered() -> void:
	pass # Replace with function body.

func _on_leave_button_focus_exited() -> void:
	pass # Replace with function body.

func _on_leave_button_button_up() -> void:
	pass # Replace with function body.

func _on_leave_button_button_down() -> void:
	pass # Replace with function body.



func _on_sit_down_button_pressed() -> void:
	pass # Replace with function body.

func _on_leave_button_title_pressed() -> void:
	get_tree().quit()

#endregion
