extends CSGBox3D

@onready var audio_player = $"../AudioStreamPlayer3D"

var play_audio = true

func interact():
	
	if play_audio:
		
		if not audio_player.playing and not audio_player.stream_paused:
			audio_player.play()
		audio_player.stream_paused = false
		
	
