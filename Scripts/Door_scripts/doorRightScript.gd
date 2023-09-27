extends Node3D


@export var doorCooldown: Timer


func _Shutdown_Right_door():
	PlayerVariables.rightDoorIndex_int = PlayerVariables.rightDoorIndex_int + 1
	
	if PlayerVariables.rightDoorIndex_int == 1:
		PlayerVariables.isRightDoorOpen_bool = true
		$AnimationPlayer.play("open_right_door")
		
	else:
		pass

func _Open_Right_door():

	PlayerVariables.rightDoorIndex_int = PlayerVariables.rightDoorIndex_int + 1
	
	if PlayerVariables.rightDoorIndex_int > 1:
		PlayerVariables.rightDoorIndex_int = 0
		
	if PlayerVariables.rightDoorIndex_int == 1:
		PlayerVariables.isRightDoorOpen_bool = true
		$AnimationPlayer.play("open_right_door")
		PlayerVariables.powerUsage_int = PlayerVariables.powerUsage_int - 1
		
	if PlayerVariables.rightDoorIndex_int == 0:
		PlayerVariables.isRightDoorOpen_bool = false
		$AnimationPlayer.play("close_right_door")
		PlayerVariables.powerUsage_int = PlayerVariables.powerUsage_int + 1
		
	doorCooldown.start()
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	
	if doorCooldown.is_stopped():
		PlayerVariables.canOpenRightDoor_bool = true
	else:
		PlayerVariables.canOpenRightDoor_bool = false

	if PlayerVariables.powerShutdown_bool == true:
		_Shutdown_Right_door()
	
	pass

func _on_door_buttonright_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and PlayerVariables.canOpenRightDoor_bool == true \
	and PlayerVariables.powerShutdown_bool == false:

		_Open_Right_door()
		$doorAudio.play()
	pass # Replace with function body.
