extends Node3D
var isLeftDoorOpen = false
var isLeftDoorIndex = 0


var canOpenDoor = false
@onready var doorCooldown = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$AnimationPlayer.play("RESET")
	pass # Replace with function body.

func _Open_Left_door():

	isLeftDoorIndex = isLeftDoorIndex + 1
	if isLeftDoorIndex > 1:
		isLeftDoorIndex = 0
	if isLeftDoorIndex == 1:
		isLeftDoorOpen = true
		print("open")
		$AnimationPlayer.play("open_door")
	if isLeftDoorIndex == 0:
		isLeftDoorOpen = false
		print("close")
		$AnimationPlayer.play("close_door")
	doorCooldown.start()
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if doorCooldown.is_stopped():
		canOpenDoor = true
	else:
		canOpenDoor = false

	if Input.is_action_just_pressed("ToggleDoor") and canOpenDoor == true:
		_Open_Left_door()
	pass


func _on_door_button_left_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and canOpenDoor == true:
		_Open_Left_door()
	pass # Replace with function body.
