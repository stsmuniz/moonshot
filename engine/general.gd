extends Node

var sfx_list = {
	'company_name': "res://assets/sfx/company_name.wav",
	'gunshot': "res://assets/sfx/9mm Gunshot _ Sound Effect!.wav",
	'moonhit': "res://assets/sfx/pew.wav",
	'bulletgo': "res://assets/sfx/pshew.wav",
	'gamestart': "res://assets/sfx/title_confirm.wav",
	'cicle': "res://assets/sfx/menu_cicle.wav",
	'gun': "res://assets/sfx/totally_not_samurai_corby.wav",
	'banana': "res://assets/sfx/Banana.mp4.mp3.wav",
	'no': "res://assets/sfx/No.wav"
}

var song_list = {
	'menu': "res://assets/songs/Albatross Lexica.ogg",
	'character': "res://assets/songs/Laser Drops HiP CoLouR.ogg",
	'wind': "res://assets/songs/Wind-Mark_DiAngelo-1940285615.ogg",
	'moon': "res://assets/songs/Frank Sinatra - Fly Me To The Moon (SNES Remix).ogg"
}

onready var music_player = $MusicPlayer
onready var master_volume = AudioServer.get_bus_index("Master")

func _ready():
	changeAudioVolume(-12)

var difficulty = 1

func getAudioVolume():
	var volume = AudioServer.get_bus_volume_db(master_volume)
	return volume

func changeAudioVolume(volume):
	volume = min(0, volume)
	AudioServer.set_bus_volume_db(master_volume, volume)
	AudioServer.set_bus_mute(master_volume, volume == -48)
	return getAudioVolume()

func playMusic(song):
	music_player.stop()
	music_player.stream = load(song_list[song])
	music_player.play()

func stopMusic():
	music_player.stop()

func playSfx(sfx):
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load(sfx_list[sfx])
	player.play()
