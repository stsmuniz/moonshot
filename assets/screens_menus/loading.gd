extends Control

onready var timer = $Timer

func _ready():
	General.stopMusic()
	timer = SceneChanger.seconds_to_load

func _on_Timer_timeout():
	SceneChanger.change_to_loaded()
