extends Node3D


@onready var doorCooldown = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	

	pass # Replace with function body.

func _Shutdown_Right_door():
	PlayerVariables.rightDoorIndex = PlayerVariables.rightDoorIndex + 1
	if PlayerVariables.rightDoorIndex == 1:
		PlayerVariables.isRightDoorOpen = true
		$AnimationPlayer.play("open_right_door")
		
	else:
		pass

func _Open_Right_door():

	PlayerVariables.rightDoorIndex = PlayerVariables.rightDoorIndex + 1
	if PlayerVariables.rightDoorIndex > 1:
		PlayerVariables.rightDoorIndex = 0
	if PlayerVariables.rightDoorIndex == 1:
		PlayerVariables.isRightDoorOpen = true
		print("open")
		$AnimationPlayer.play("open_right_door")
		PlayerVariables.powerUsage = PlayerVariables.powerUsage - 1
	if PlayerVariables.rightDoorIndex == 0:
		PlayerVariables.isRightDoorOpen = false
		print("close")
		$AnimationPlayer.play("close_right_door")
		PlayerVariables.powerUsage = PlayerVariables.powerUsage + 1
	doorCooldown.start()
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	
	if doorCooldown.is_stopped():
		PlayerVariables.canOpenRightDoor = true
	else:
		PlayerVariables.canOpenRightDoor = false

	if Input.is_action_just_pressed("ToggleRightDoor") and PlayerVariables.canOpenRightDoor == true and PlayerVariables.powerShutdown == false:
		_Open_Right_door()
	
	if PlayerVariables.powerShutdown == true:
		_Shutdown_Right_door()
	
	pass

func _on_door_buttonright_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and PlayerVariables.canOpenRightDoor == true and PlayerVariables.powerShutdown == false:
		_Open_Right_door()
	pass # Replace with function body.
