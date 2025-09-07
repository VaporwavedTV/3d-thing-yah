extends Sprite2D

@onready var cameraview = $/root/World/AllThings/screen/CSGBox3D15/SubViewport

func _ready() -> void:
	
	texture = cameraview.get_texture()
	
