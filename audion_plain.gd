extends Node3D

@onready var audio_player = get_node("AudioStreamPlayer3D")

var play_audio = true


func interact():
	
	if play_audio:
		
		if not audio_player.playing and not audio_player.stream_paused:
			audio_player.play()
		audio_player.stream_paused = false
		
		play_audio = false
	
	else:
		if audio_player.playing:
			audio_player.stream_paused = true
		play_audio = true
		
	

func _process(_delta):
	if audio_player.stream_paused == false:
		if play_audio == true:
			audio_player.stream_paused = true
			
		
	
