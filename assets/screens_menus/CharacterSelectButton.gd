extends Sprite

export var key_pressed = 'ui_left'

onready var animation = $AnimationPlayer
onready var sprite : Sprite = $"."

func _ready():
	sprite.flip_h = key_pressed == 'ui_right'

func _unhandled_key_input(event):
	if event.is_action_pressed(key_pressed):
		animation.play("pressed")
		yield(animation, "animation_finished")
		animation.play("idle")
