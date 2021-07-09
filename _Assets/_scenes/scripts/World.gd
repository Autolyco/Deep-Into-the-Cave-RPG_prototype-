extends Node2D



func _ready():
	pass


func _process(delta):
	pass

func _trigger_combat():
	randomize()
	var trigger_percentage = rand_range(0,100)
	if trigger_percentage >= 99.9:
		print("combat")






func on_each_steps():
	_trigger_combat()
	pass # Replace with function body.
