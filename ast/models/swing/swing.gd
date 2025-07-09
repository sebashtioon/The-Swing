extends Node3D

@export var swing_anim_player : AnimationPlayer
@export var camera_pos_ref : Node3D

func swing():
	swing_anim_player.play(&"main")
 
