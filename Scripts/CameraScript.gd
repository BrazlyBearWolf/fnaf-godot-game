extends Camera3D

var yaw_f := 0.0
var tilt_f := 0.0
const view_sensitivity = 0.03


func _ready():
	

	set_process(true)
	set_process_input(true)
	
	

	pass 

func _process(delta):
	if tilt_f > 4:
		tilt_f = 4
	if tilt_f < -4:
		tilt_f = -4
	if yaw_f > 18:
		yaw_f = 18
	if yaw_f < -18:
		yaw_f = -18	

	if get_rotation_degrees().y < -18:
		set_rotation_degrees(Vector3(tilt_f, -18, 0))
	if get_rotation_degrees().y > 18:
		set_rotation_degrees(Vector3(tilt_f, 18, 0))
	if get_rotation_degrees().x > 4:
		set_rotation_degrees(Vector3(4, yaw_f, 0))
	if get_rotation_degrees().x < -4:
		set_rotation_degrees(Vector3(-4, yaw_f, 0))

	pass

func _input(event):
	if event is InputEventMouseMotion:
		yaw_f = fmod(yaw_f - event.relative.x * view_sensitivity, 360)
		tilt_f = fmod(tilt_f - event.relative.y * view_sensitivity, 360)
		set_rotation(Vector3(deg_to_rad(tilt_f), deg_to_rad(yaw_f), 0))
