extends Camera3D

var yaw = 0
var tilt = 0
var view_sensitivity = 0.03

var isLeftDoorOpen
var isLeftDoorIndex = 0





func _ready():
	
	var isLeftDoorOpen = get_node("/root/PlayerVariables")
	set_process(true)
	set_process_input(true)

	pass 

func _process(delta):
	if tilt > 4:
		tilt = 4
	if tilt < -4:
		tilt = -4
	if yaw > 18:
		yaw = 18
	if yaw < -18:
		yaw = -18	
	
	if get_rotation_degrees().y < -18:
		set_rotation_degrees(Vector3(tilt, -18, 0))
	if get_rotation_degrees().y > 18:
		set_rotation_degrees(Vector3(tilt, 18, 0))
	if get_rotation_degrees().x > 4:
		set_rotation_degrees(Vector3(4, yaw, 0))
	if get_rotation_degrees().x < -4:
		set_rotation_degrees(Vector3(-4, yaw, 0))

	pass

func _input(event):
	if event is InputEventMouseMotion:
		yaw = fmod(yaw - event.relative.x * view_sensitivity, 360)
		tilt = fmod(tilt - event.relative.y * view_sensitivity, 360)
		set_rotation(Vector3(deg_to_rad(tilt), deg_to_rad(yaw), 0))



#func _on_door_button_left_input_event(camera, event, position, normal, shape_idx):
#	if event is InputEventMouse:
#		DoorLeftScript._Open_Left_door()
#
#	pass # Replace with function body.
