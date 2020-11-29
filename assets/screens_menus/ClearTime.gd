extends Control

func _on_Timer_timeout():
	SceneChanger.load_to = 'title_screen'
	SceneChanger.change_scene('loading_screen')
