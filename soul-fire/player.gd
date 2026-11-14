extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	
		
	if Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite2D.play("Run_Left")
		

	if Input.is_action_just_pressed("ui_right"):
		$AnimatedSprite2D.play("Run_Right")
			
	
	if Input.is_action_just_pressed("ui_up"):
		$AnimatedSprite2D.play("Idle")
	
	# Change 'while' to 'if'
	if is_on_floor() and direction == 0:
		$AnimatedSprite2D.play("Idle")
		
	#if Input.is_action_just_pressed("ui_left"+"ui_up"):
		#$AnimatedSprite2D.play("Run_Left")

	#if Input.is_action_just_pressed("ui_right"+"ui_up"):
		#$AnimatedSprite2D.play("Run_Right")
			
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if Input.is_action_just_pressed("ui_down") and is_on_floor():
		velocity.y = JUMP_VELOCITY
