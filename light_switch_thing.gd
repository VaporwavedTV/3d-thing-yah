extends Node3D

var ion = true

func interact():
	
	if ion:
		get_node("../OmniLight3D").visible = true
		get_node("../OmniLight3D2").visible = true
		get_node("../OmniLight3D3").visible = true
		ion = false
		
	
	else:
		get_node("../OmniLight3D").visible = false
		get_node("../OmniLight3D2").visible = false
		get_node("../OmniLight3D3").visible = false
		ion = true
		
	
