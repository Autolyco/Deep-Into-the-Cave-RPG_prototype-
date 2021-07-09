extends Node2D



func _ready():
	pass


func _process(delta):
	pass

func _trigger_combat():
	randomize()
	
	var trigger_percentage = rand_range(0,100)
	if trigger_percentage >= 99.85:
		print("combat")






func _on_each_step_character():
	_trigger_combat()

