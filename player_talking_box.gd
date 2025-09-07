extends Control

var busy = false
var animated_text = false
var start_jumper = true
var jumper = 0.20
@onready var font = $Panel/Label.get_theme_default_font()
var transform = Transform2D(Vector2(1.0, 0.25), Vector2(0.0, 1.0), Vector2(0.0, 0.0))
var textime = 0
var animating = false
@onready var previous_text = $Panel/Label.text
@onready var appear_animation = $AnimationPlayer




func _process(_delta):
	
	if animated_text == true:
		jumpy_letter()
		
	
	$Panel/Label.visible_characters = textime
	
	if animating:
		
		textime += 0.4
		visible = true
		
	
	
		if $Panel/Label.visible_characters == $Panel/Label.text.length():
			
			animating = false
			previous_text = $Panel/Label.text
			hide_later()
			
	
	
	
	
	
	
	
	
	
	
	


func show_text(new_text: String):
	
	if busy:
		return
	
	$Panel/Label.text = new_text
	$Panel/UnderLabel.text = new_text
	appear_animation.play("Start think anim")
	textime = 0
	animating = true
	busy = true
	

func hide_later() -> void:
	
	busy = true
	await get_tree().create_timer(1.0).timeout
	appear_animation.play_backwards("Start think anim")
	await appear_animation.animation_finished
	visible = false
	busy = false
	

func jumpy_letter():
	
	if jumper >= 0.15:
		start_jumper = false
		
	elif jumper <= -0.05:
		start_jumper = true
		
	
	if start_jumper == true:
		jumper += 0.02
		
	else:
		jumper -= 0.02
		
	
	transform = Transform2D(Vector2(1.0, 0.15 + jumper * 0.2), Vector2(jumper * 0.5, jumper + 1), Vector2(0.0, 0.0))
	
	font.variation_transform = transform
	
	
