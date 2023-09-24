extends Area3D

@export var light: OmniLight3D

# Called when the node enters the scene tree for the first time.
func _ready():
	light.hide()
	pass # Replace with function body.

func _Toggle_Door_Light():
	

	if PlayerVariables.leftDoorIndex_int == 1:
		light.hide()
	else:
		light.show()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerVariables.powerShutdown_bool == true:
		light.hide()
		


func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton \
	and PlayerVariables.canOpenLeftDoor_bool == true \
	and PlayerVariables.powerShutdown_bool == false:
		
		_Toggle_Door_Light()
	pass # Replace with function body.
