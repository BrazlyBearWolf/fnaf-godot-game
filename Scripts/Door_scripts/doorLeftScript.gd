extends Node3D


@export var doorCooldown: Timer


func _Shutdown_left_door():
	PlayerVariables.leftDoorIndex_int = PlayerVariables.leftDoorIndex_int + 1
	
	if PlayerVariables.leftDoorIndex_int == 1:
		PlayerVariables.isLeftDoorOpen_bool = true
		$AnimationPlayer.play("open_door")
		
	else:
		pass

func _Open_Left_door():
	
	PlayerVariables.leftDoorIndex_int = PlayerVariables.leftDoorIndex_int + 1
	
	if PlayerVariables.leftDoorIndex_int > 1:
		PlayerVariables.leftDoorIndex_int = 0
		
	if PlayerVariables.leftDoorIndex_int == 1:
		PlayerVariables.isLeftDoorOpen_bool = true
		$AnimationPlayer.play("open_door")
		PlayerVariables.powerUsage_int = PlayerVariables.powerUsage_int - 1
		
	if PlayerVariables.leftDoorIndex_int == 0:
		PlayerVariables.isLeftDoorOpen_bool = false
		$AnimationPlayer.play("close_door")

		PlayerVariables.powerUsage_int = PlayerVariables.powerUsage_int + 1
	
	doorCooldown.start()
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if doorCooldown.is_stopped():
		PlayerVariables.canOpenLeftDoor_bool = true
	else:
		PlayerVariables.canOpenLeftDoor_bool = false


	if PlayerVariables.powerShutdown_bool == true:
		_Shutdown_left_door()
	
	pass


func _on_door_button_left_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and PlayerVariables.canOpenLeftDoor_bool == true \
	and PlayerVariables.powerShutdown_bool == false:
		_Open_Left_door()
		$doorClose.play()
	pass # Replace with function body.
