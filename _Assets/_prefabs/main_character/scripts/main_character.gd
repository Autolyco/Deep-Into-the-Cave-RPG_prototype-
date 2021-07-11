extends KinematicBody2D

var movement:Vector2

signal walk_trigger

const speed = 17.5

var is_pause:bool = false
var is_talking:bool = false



func _ready():
	print(str(self.name + 'have been iniatilized sucessfully'))

func _process(delta):
	if !is_talking :
		if !is_pause : 
			control_()
		else :
			control_menu()
	else :
		control_talking()



func control_():
	
	movement.x = 0
	movement.y = 0
	
	
	if Input.is_action_pressed("UP"):
		movement.y -= speed
		emit_signal("walk_trigger")
		
		_animations("UP")
		
	if Input.is_action_pressed("DOWN"):
		movement.y += speed 
		emit_signal("walk_trigger")
		
		_animations("DOWN")
		
	if Input.is_action_pressed("LEFT"):
		movement.x -= speed 
		emit_signal("walk_trigger")
		
		_animations("LEFT")
		
	if Input.is_action_pressed("RIGHT"):
		movement.x +=  speed
		emit_signal("walk_trigger")
		
		
		_animations("RIGHT")
	
	
	
	
	if Input.is_action_just_released("MENU"):
		if $CanvasLayer/Interface/menu_interface.visible == true :
			$CanvasLayer/Interface/menu_interface.visible = false
		else :
			$CanvasLayer/Interface/menu_interface.visible = true
	
	
	movement = move_and_slide(movement).normalized()

func control_talking():
	print('is talking')

func control_menu():
	
	var input_number:int = 0
	
	if Input.is_action_pressed("UP"):
		input_number += 1
	
	if Input.is_action_pressed("DOWN"):
		input_number -= 0
	
	
	if input_number > 2:
		input_number = 0
	
	
	
	match(input_number):
		0 :
			print('ok')
		1:
			print('ok')
		2:
			print('ok')
	
	
	if Input.is_action_pressed("MENU"):
		is_pause = false

func _animations(current_action:String):
	
	match(current_action):
		"LEFT":
			if movement != Vector2(0,0):
				$animation_sprite.play("move_left")
			else :
				$animation_sprite.play("stance_left")
	
	
	
	pass

