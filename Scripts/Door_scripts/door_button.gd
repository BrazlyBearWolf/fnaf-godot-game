extends Area3D



@onready var light = $OmniLight3D

# Called when the node enters the scene tree for the first time.
func _ready():
	light.hide()
	pass # Replace with function body.

func _Toggle_Door_Light():
	

	if PlayerVariables.isLeftDoorOpen == true:
		light.hide()
	else:
		light.show()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ToggleLeftDoor") and PlayerVariables.canOpenLeftDoor == true:
		_Toggle_Door_Light()
	pass



func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and PlayerVariables.canOpenLeftDoor == true:
		_Toggle_Door_Light()
	pass # Replace with function body.
