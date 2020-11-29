extends Control

onready var backButton = $BackButton

func _ready():
	backButton.grab_focus()
	General.playMusic('character')

func _on_BackButton_pressed():
	SceneChanger.change_scene('title_screen')
