extends Control

func _input(event):
	if event.is_action_pressed("shoot") and $MenuAnimationPlayer.is_playing():
		$MenuAnimationPlayer.stop()
		$Label.visible = false
		$Menu.visible = true
		$Menu/VBoxContainer/NewGameButton.grab_focus()
		$AnimationPlayer.play("bam!")
		General.playSfx('gunshot')

func _on_OptionsButton_pressed():
	SceneChanger.change_scene('options')


func _on_QuitGameButton_pressed():
	get_tree().quit()

func _ready():
	General.playMusic("menu")


func _on_NewGameButton_pressed():
	if $Menu.visible == true:
		SceneChanger.load_to = 'character_select'
		SceneChanger.change_scene('loading_screen')


func _on_LoadGameButton_pressed():
	SceneChanger.change_scene('save_menu')
