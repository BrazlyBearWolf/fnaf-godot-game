extends Node3D

@export var cameras: Array[Sprite3D]

@export var switchCooldown: Timer

var canSwitch := false

var cameraIndex_int := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	switchCooldown.start()
	pass # Replace with function body.

func _Next_Cam():
	
	canSwitch = false
	switchCooldown.start()
	
	var newIndex = cameraIndex_int + 1
	
	if newIndex >= cameras.size():
		newIndex = 0
	
	cameraIndex_int = newIndex
	$camSwitchSFX.play()
	
	for i in cameras.size():
		cameras[i].hide()
		cameras[cameraIndex_int].show()

	
func _Previous_Cam():
	
	canSwitch = false
	switchCooldown.start()
	
	var newIndex = cameraIndex_int - 1
	
	if newIndex < 0:
		newIndex = cameras.size() - 1
	
	cameraIndex_int = newIndex
	$camSwitchSFX.play()
	
	for i in cameras.size():
		cameras[i].hide()
		cameras[cameraIndex_int].show()
	

func _Switch_Cooldown():
	if switchCooldown.is_stopped():
		canSwitch = true

func _process(delta):

	if Input.is_action_just_pressed("ToggleRightDoor"):
		_Switch_Cooldown()
		if canSwitch == true:
			_Next_Cam()
			
		else: pass
	if Input.is_action_just_pressed("ToggleLeftDoor"):
		_Switch_Cooldown()
		if canSwitch == true:
			_Previous_Cam()
		else:
			pass
