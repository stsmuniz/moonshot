extends CanvasLayer

signal scene_changed()

onready var animation_player = $AnimationPlayer
onready var black = $Control/Black

var scenes = {
	'title_screen': "res://assets/screens_menus/TitleScreen.tscn",
	'presentation': "res://assets/screens_menus/presentation.tscn",
	'character_select': "res://assets/screens_menus/CharacterSelect.tscn",
	'loading_screen': "res://assets/screens_menus/loading.tscn",
	'main': "res://assets/screens_menus/main.tscn",
	'options': "res://assets/screens_menus/Options.tscn",
	'credits': "res://assets/screens_menus/Credits.tscn",
	'save_menu': "res://assets/screens_menus/SaveSelect.tscn",
	'clear_time': "res://assets/screens_menus/ClearTime.tscn"
}

var load_to
var seconds_to_load = 3

func change_scene(scene, delay = 0.5):
	yield(get_tree().create_timer(delay), "timeout")
	animation_player.play("fade")
	yield(animation_player, "animation_finished")
	assert(get_tree().change_scene(scenes[scene]) == OK)
	animation_player.play_backwards("fade")
	emit_signal("scene_changed")
	
func change_to_loaded():
	change_scene(load_to)
