extends Node3D


@onready var doorCooldown = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$AnimationPlayer.play("RESET")
	pass # Replace with function body.


func _Shutdown_left_door():
	PlayerVariables.leftDoorIndex = PlayerVariables.leftDoorIndex + 1
	if PlayerVariables.leftDoorIndex == 1:
		PlayerVariables.isLeftDoorOpen = true
		$AnimationPlayer.play("open_door")
		
	else:
		pass

func _Open_Left_door():
	
	PlayerVariables.leftDoorIndex = PlayerVariables.leftDoorIndex + 1
	if PlayerVariables.leftDoorIndex > 1:
		PlayerVariables.leftDoorIndex = 0
	if PlayerVariables.leftDoorIndex == 1:
		PlayerVariables.isLeftDoorOpen = true
		print("left open")
		$AnimationPlayer.play("open_door")
		PlayerVariables.powerUsage = PlayerVariables.powerUsage - 1
	if PlayerVariables.leftDoorIndex == 0:
		PlayerVariables.isLeftDoorOpen = false
		print("left close")
		$AnimationPlayer.play("close_door")
		PlayerVariables.powerUsage = PlayerVariables.powerUsage + 1
	doorCooldown.start()
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if doorCooldown.is_stopped():
		PlayerVariables.canOpenLeftDoor = true
	else:
		PlayerVariables.canOpenLeftDoor = false

	if Input.is_action_just_pressed("ToggleLeftDoor") and PlayerVariables.canOpenLeftDoor == true and PlayerVariables.powerShutdown == false:
		_Open_Left_door()
		
	if PlayerVariables.powerShutdown == true:
		_Shutdown_left_door()
	
	pass


func _on_door_button_left_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and PlayerVariables.canOpenLeftDoor == true and PlayerVariables.powerShutdown == false:
		_Open_Left_door()
	pass # Replace with function body.
