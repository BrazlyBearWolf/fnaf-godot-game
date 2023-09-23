extends Area3D


var lightOn = false
var lightIndex = 0
@onready var light = $OmniLight3D

# Called when the node enters the scene tree for the first time.
func _ready():
	light.hide()
	pass # Replace with function body.

func _Toggle_Door_Light():
	lightIndex = lightIndex + 1
	if lightIndex > 1:
		lightIndex = 0
	
	if lightIndex == 1:
		lightOn = true
	else:
		lightOn = false

	if lightOn == true:
		light.show()
	else:
		light.hide()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ToggleDoor"):
		_Toggle_Door_Light()
	pass


func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		_Toggle_Door_Light()
	pass # Replace with function body.
