extends CSGCombiner3D



@onready var current_text = $"../RichTextLabel".text.length()
var talking = false
var textime = 0
var no_disappear = false


func interact():
	
	talking = true
	$"../RichTextLabel".visible = true
	
	
	
	textime = 0
	no_disappear = true
	



func _process(_delta):
	
	
	if talking == true:
		
		textime += 0.4
		
		$"../RichTextLabel".visible_characters = textime
		
		if textime > current_text and no_disappear == true:
			
			$"../Sprite3D/SubViewport/Label".text = "Eh I'm fine."
			$"../Sprite3D".visible = true
			
		
	

func thisappear():
	
	no_disappear = false
	
