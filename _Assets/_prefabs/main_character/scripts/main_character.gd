extends KinematicBody2D

var movement:Vector2

signal walk_trigger

const speed = 17.5
var is_pause:bool = false
var is_talking:bool = false



func _ready():
	print(str(self.name + 'have been iniatilized sucessfully'))

func _process(delta):
	if !is_pause :
		if !is_talking : 
			control_()
		else :
			print('is talking')
	else :
		print('is in pause')


func control_():
	
	movement.x = 0
	movement.y = 0
	
	
	if Input.is_action_pressed("UP"):
		movement.y -= speed
		emit_signal("walk_trigger")
	if Input.is_action_pressed("DOWN"):
		movement.y += speed 
		emit_signal("walk_trigger")
	if Input.is_action_pressed("LEFT"):
		movement.x -= speed 
		emit_signal("walk_trigger")
	if Input.is_action_pressed("RIGHT"):
		movement.x +=  speed
		emit_signal("walk_trigger")
	
	
	
	movement = move_and_slide(movement).normalized()
