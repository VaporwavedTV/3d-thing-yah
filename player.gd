extends CharacterBody3D

const JUMP_VELOCITY = 4.5
var speed = 4
var gravity = 9.8
@onready var headbob = $head/Camera3D/headbob
@onready var collision_shape = get_node("CollisionShape3D")
var satdown = false
@onready var Chair = get_node("/root/World").find_child("Chair", true)
var paused_time = false

func _physics_process(delta):
	
	
	
	
	if satdown:
		if Input.is_action_just_pressed("E"):
			axis_lock_linear_x = false
			axis_lock_linear_y = false
			axis_lock_linear_z = false
			satdown = false
			Chair.gotup()
			
		
	
	
	
	if is_on_floor():
		speed = 4
		
		
	
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	
	if Input.is_action_pressed("run"):
		if is_on_floor():
			speed = 8
			
			
	elif Input.is_action_just_released("run") and not is_on_floor():
		speed = 8
		
		
	
	elif Input.is_action_just_released("run"):
		speed = 4
		
	
	if Input.is_action_just_released("run") and not is_on_floor():
		speed = 8
		
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_pressed("crouch"):
		collision_shape.disabled = true
		if is_on_floor():
			speed = 2
			
		
	
	if Input.is_action_just_released("crouch"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			await get_tree().create_timer(0.6).timeout
			collision_shape.disabled = false
			
		
		else:
			collision_shape.disabled = false
			
		
	
	if Input.is_action_pressed("P"):
		velocity.y = 10
		
	
	if Input.is_action_just_pressed("o"):
		if paused_time:
			process_mode = Node.PROCESS_MODE_INHERIT
			get_tree().paused = false
			paused_time = false
		else:
			process_mode = Node.PROCESS_MODE_ALWAYS
			get_tree().paused = true
			paused_time = true
		
	
	
	var input_dir = Input.get_vector("left", "right", "up", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		
		
		
		
		
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		
	
	
	
	
	
	
	
	
	
	move_and_slide()


func sitting():
	
	axis_lock_linear_x = true
	axis_lock_linear_y = true
	axis_lock_linear_z = true
	satdown = true
	

func nomoving():
	axis_lock_linear_x = true
	axis_lock_linear_y = true
	axis_lock_linear_z = true
	

func yesmoving():
	axis_lock_linear_x = false
	axis_lock_linear_y = false
	axis_lock_linear_z = false
	
