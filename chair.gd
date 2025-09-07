extends StaticBody3D

@onready var player = get_node("/root/World").find_child("player", true)
var sitanim = false

func interact():
	
	$CollisionShape3D2.disabled = true
	$CollisionShape3D.disabled = true
	
	$AnimationPlayer.play_backwards("sitmedown")
	
	sitanim = true
	
	player.sitting()
	

func gotup():
	$CollisionShape3D2.disabled = false
	$CollisionShape3D.disabled = false
	$AnimationPlayer.play("sitmedown")
	sitanim = true
	

func _process(_delta):
	if sitanim:
		player.global_position = $satplace.global_position
		
		if not $AnimationPlayer.is_playing():
			sitanim = false
			
		
	
