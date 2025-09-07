extends Window

@onready var player = get_node("/root/World/player")
@onready var playerhead = get_node("/root/World/player/head")
var open = false

func _process(_delta):
	
	if $/root/World/AllThings/screen/CSGBox3D15.turnon and open:
		visible = true
		
	else:
		visible = false
		
	
	if visible == true:
		
		if Input.is_action_just_pressed("escape"):
			$"..".visible = false
			visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			player.yesmoving()
			playerhead.yes_move()
			$"/root/World/AllThings/player/head/Camera3D/raycast".collide_with_bodies = true
			$/root/World/AllThings/screen/CSGBox3D15.turnon = false
			
		
		
		
	
	
	var child = get_child(0)
	
	if child is Sprite2D and child.texture:
		
		var tex_size = child.texture.get_size()
		
		# Ratio of parent to texture
		var scale_x = self.size.x / tex_size.x
		var scale_y = self.size.y / tex_size.y
		
		# Pick the smaller one so it fits inside
		var scale_factor = min(scale_x, scale_y)
		
		child.scale = Vector2(scale_factor, scale_factor)
		
		var new_size = tex_size * scale_factor
		child.position = (Vector2(self.size) / 2) - (new_size / 2)
		
		child.position = Vector2(self.size) / 2
		
		
	
	


func open_window():
	open = true
	

func close_window():
	open = false
	
