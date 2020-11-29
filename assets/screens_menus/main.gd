extends Control

onready var animPlayer = $AnimationPlayer
onready var shotAnim = $ShotAnim
onready var bulletAnim = $BulletAnim
onready var ready = $ReadyMessage

var ready_to_shot = false

func _ready():
	General.playMusic("wind")
	General.playSfx('gun')

func _input(event):
	if event.is_action_pressed("shoot") and ready_to_shot:
		ready.visible = false
		shotAnim.play('Shot')
		General.playSfx('gunshot')
		bulletAnim.play('pew')
		General.stopMusic()
		ready_to_shot = false

func _on_BulletAnim_animation_finished(pew):
	SceneChanger.change_scene("credits")


func _on_AnimationPlayer_animation_finished(anim_name):
	ready.visible = true
	ready_to_shot = true
