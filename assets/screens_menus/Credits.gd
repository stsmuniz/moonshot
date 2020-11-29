extends Control

func _ready():
	General.playMusic("moon")

func _on_AnimationPlayer_animation_finished(anim_name):
	SceneChanger.change_scene('clear_time')
