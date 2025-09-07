extends CSGBox3D

@onready var audio_player = $"../AudioStreamPlayer3D"

func interact():
	audio_player.stream_paused = true
	
