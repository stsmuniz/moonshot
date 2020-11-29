extends Control

onready var character_image = $CharacterImage
onready var name_label = $CharacterName
onready var life = $Stats/LifeStatNumber
onready var speed = $Stats/SpeedStatNumber
onready var precision = $Stats/PrecisionStatNumber
onready var range_attr = $Stats/RangeStatNumber3
onready var rof = $Stats/RofStatNumber
onready var ability = $Ability/AbilityName

var characters = {
	0: {
		'name': 'Sean o\' Connor',
		'attributes': {
			'life': 2,
			'speed': 3,
			'precision': 4,
			'range_value': 3,
			'rof': 3,
		},
		'ability': 'Sneak Roll'
	},
	1: {
		'name': 'Daisy Flowers',
		'attributes': {
			'life': 6,
			'speed': 2,
			'precision': 4,
			'range_value': 2,
			'rof': 1,
		},
		'ability': 'Double Damage'
	},
	2: {
		'name': 'U2F0aXJl',
		'attributes': {
			'life': 1,
			'speed': 4,
			'precision': 1,
			'range_value': 4,
			'rof': 5,
		},
		'ability': 'Weapon Steal'
	},
	3: {
		'name': '??????????',
		'attributes': {
			'life': 5,
			'speed': 4,
			'precision': 3,
			'range_value': 4,
			'rof': 4
		},
		'ability': '????? ?????????'
	}
}

var current_position = 0

func _unhandled_key_input(event):
	if event.is_action_pressed("ui_left"):
		current_position -=1
		current_position = max(current_position, 0)
	elif event.is_action_pressed("ui_right"):
		current_position +=1
		current_position = min(current_position, 3)
	elif event.is_action_pressed("shoot"):
		if current_position != 3:
			SceneChanger.load_to = 'main'
			SceneChanger.seconds_to_load = 6
			SceneChanger.change_scene('loading_screen')
			General.playSfx('gamestart')
		else:
			General.playSfx('no')
			
	change_character_info(current_position)
	if current_position == 3:
		character_image.modulate = Color(0, 0, 0)
		character_image.scale = Vector2(0.8, 0.8)
	else:
		character_image.modulate = Color(1, 1, 1)
		character_image.scale = Vector2(1, 1)

func _ready():
	General.playMusic("character")
	change_character_info(current_position)
	
func repeat_string(count:int = 1, _string:String = '| '):
	var string:String = ""
	for i in range(count):
		string += _string
	return string

func change_character_info(index):
	var attributes = characters[index].attributes
	name_label.text = characters[index].name
	character_image.region_rect = Rect2(96 * index, 0, 96, 96)
	life.text = repeat_string(attributes.life)
	speed.text = repeat_string(attributes.speed)
	precision.text = repeat_string(attributes.precision)
	range_attr.text = repeat_string(attributes.range_value)
	rof.text = repeat_string(attributes.rof)
	ability.text = characters[index].ability
