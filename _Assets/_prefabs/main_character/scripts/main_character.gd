extends KinematicBody2D



signal walk_trigger

const speed = 17.5

var is_pause:bool = false
var is_talking:bool = false

var last_movement: String

var input_number:int = 0




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
	
	$CanvasLayer/Interface/menu_interface.visible = false
	
	
	var movement:Vector2
	
	if Input.is_action_pressed("UP"):
		movement.y -= speed
		emit_signal("walk_trigger")
		last_movement = 'up'
		
		_animations(movement)
		
	elif Input.is_action_pressed("DOWN"):
		movement.y += speed 
		emit_signal("walk_trigger")
		
		
		last_movement = 'down'
		_animations(movement)
		
		
		
	elif Input.is_action_pressed("LEFT"):
		movement.x -= speed 
		emit_signal("walk_trigger")
		
		last_movement = 'left'
		
		_animations(movement)
		
	elif Input.is_action_pressed("RIGHT"):
		movement.x +=  speed
		emit_signal("walk_trigger")
		last_movement = 'right'
		_animations(movement)
		
		
	else :
		movement = Vector2(0,0)
		_animations(movement)
	
	
	
	if Input.is_action_just_pressed("MENU"):
		is_pause = true
	
	
	movement = move_and_slide(movement).normalized()

func control_talking():
	print('is talking')

func control_menu():
	
	$CanvasLayer/Interface/menu_interface.visible = true
	
	var inventory_font:String
	var options_font:String
	var party_font:String
	var quit_font:String
	
	
	if Input.is_action_just_pressed("UP"):
		input_number += 1
	if Input.is_action_just_pressed("DOWN"):
		input_number -= 1
	
	
	if input_number > 2:
		input_number = 0
	elif input_number < 0 :
		input_number = 2
	
	
	match(input_number):
		0 :
			print(input_number)
		1:
			print(input_number)
		2:
			print(input_number)
		3:
			print(input_number)
	
	if Input.is_action_just_pressed("MENU"):
		is_pause = false


func _animations(movement:Vector2):
	
	print(movement)
	
	if movement != Vector2(0,0):
		if last_movement == '' :
			$AnimatedSprite.play("movement_down")
		else :
			$AnimatedSprite.play("movement_"+last_movement)
	else :
		if last_movement == '' :
			$AnimatedSprite.play("stance_down")
		else :
			$AnimatedSprite.play("stance_"+last_movement)
