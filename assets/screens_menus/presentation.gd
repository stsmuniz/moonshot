extends Control


func playBleep():
	General.playSfx('company_name')
	
func changeToMainScene():
	SceneChanger.change_scene('title_screen', 3)
