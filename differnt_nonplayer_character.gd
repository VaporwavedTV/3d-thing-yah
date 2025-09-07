extends CharacterBody3D

var textime = 0

func interact():
	
	$RichTextLabel.visible = true
	
	
	
	textime = 0
	



func _process(_delta):
	textime += 0.4
	
	$RichTextLabel.visible_characters = textime
	
