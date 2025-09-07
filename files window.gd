extends Window


var open = false


func _process(_delta):
	
	if $/root/World/AllThings/screen/CSGBox3D15.turnon and open:
		visible = true
		
	else:
		visible = false
		
	

func open_window():
	open = true
	

func close_window():
	open = false
	
