extends Control

onready var difficultyButton = $VBoxContainer/DifficultyLabel/DifficultyButton
onready var screenModeButton = $VBoxContainer/ScreenModeLabel/ScreenModeButton
onready var backButton = $VBoxContainer/BackButton
onready var volumeSlider = $VBoxContainer/VolumeLabel/VolumeSlider

var difficulties = {
	0: 'Easy',
	1: 'Normal',
	2: 'Hard'
}

func _ready():
	backButton.grab_focus()
	General.stopMusic()
	set_screen_mode_button_text()
	set_difficulty_button_text(General.difficulty)
	set_volume_value(General.getAudioVolume())

func _on_BackButton_pressed():
	SceneChanger.change_scene('title_screen')


func _on_ScreenModeButton_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	set_screen_mode_button_text()

func set_screen_mode_button_text():
	screenModeButton.text = 'Windowed'
	if OS.window_fullscreen:
		screenModeButton.text = 'Fullscreen'	

func set_difficulty_button_text(value):
	if value > 2:
		General.difficulty = 0
	elif value < 0:
		General.difficulty = 2
	difficultyButton.text = difficulties[General.difficulty]

func set_volume_value(value):
	volumeSlider.value = value

func _on_DifficultyButton_pressed():
	General.difficulty += 1
	set_difficulty_button_text(General.difficulty)

func _on_VolumeSlider_value_changed(value):
	var volume = General.changeAudioVolume(value)
	set_volume_value(volume)
	General.playSfx('cicle')


func _on_VolumeSlider_focus_entered():
	General.playSfx('cicle')


func _on_BackButton_focus_entered():
	General.playSfx('cicle')
