extends Control

@export var label_text_display : Label

func _ready() -> void:
	hide()

func display_text(text : String, time : float) -> void:
	label_text_display.visible_ratio = 0.0
	label_text_display.text = text
	show()
	
	var tween = get_tree().create_tween()
	tween.connect("finished", _on_display_text_tween_finished)
	tween.tween_property(self, "visible", true, 0.0)
	tween.tween_interval(0.7)
	tween.tween_property(label_text_display, "visible_ratio", 1.0, time)
	tween.tween_interval(3.0)

func _on_display_text_tween_finished():
	hide()
