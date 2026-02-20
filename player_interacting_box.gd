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
@onready var Say_yes_text = $Panel/YesButton
@onready var Say_no_text = $Panel/NoButton
@onready var player = get_node("/root/World").find_child("player", true)
var answer_got = false
var answer_good
var answer_bad






func _process(_delta):
	
	if animated_text == true:
		jumpy_letter()
		
	
	$Panel/Label.visible_characters = textime
	
	if animating:
		
		textime += 1.0
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
	
	Say_yes_text.visible = true
	Say_no_text.visible = true
	busy = true
	
	while not answer_got:
		await get_tree().process_frame
		
	
	appear_animation.play_backwards("Start think anim")
	await appear_animation.animation_finished
	visible = false
	Say_yes_text.visible = false
	Say_no_text.visible = false
	busy = false
	answer_got = false
	

func answer_yes():
	answer_got = true
	answer_good
	player.yesmoving()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	player.get_child(3).yes_move()
	

func answer_no():
	answer_got = true
	answer_bad
	player.yesmoving()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	player.get_child(3).yes_move()
	




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
	
	
