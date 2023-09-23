extends Area3D



@onready var light = $OmniLight3D

# Called when the node enters the scene tree for the first time.
func _ready():
	light.hide()
	pass # Replace with function body.

func _Toggle_Door_Light():
	

	if PlayerVariables.isRightDoorOpen == true:
		light.show()
	else:
		light.hide()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerVariables.powerShutdown == true:
		light.hide()
	if Input.is_action_just_pressed("ToggleRightDoor") and PlayerVariables.canOpenRightDoor == true and PlayerVariables.powerShutdown == false:
		_Toggle_Door_Light()
	pass




func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and PlayerVariables.canOpenRightDoor == true and PlayerVariables.powerShutdown == false:
		_Toggle_Door_Light()
	pass # Replace with function body.
