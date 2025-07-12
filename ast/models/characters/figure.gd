@tool
extends Node3D

func _ready() -> void:
	$AnimationPlayer.seek(0.0)
	$AnimationPlayer.stop(true)
