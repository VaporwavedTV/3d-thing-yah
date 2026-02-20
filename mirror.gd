extends Node3D

@onready var player = get_node("/root/World").find_child("player", true)
@onready var location_thing = $CSGBox3D2

func _ready():
	
	$Sprite3D.texture = $SubViewport.get_texture()
	$SubViewport/Camera3D.global_position = $Sprite3D.global_position
	



func _physics_process(_delta):
	
	$CSGBox3D3.look_at(player.global_position + Vector3(0,1,0))
	
	
	$SubViewport/Camera3D.rotation.y = $CSGBox3D3.rotation.y * -1
	$SubViewport/Camera3D.rotation.x = $CSGBox3D3.rotation.x * -1
	
	
	
	
