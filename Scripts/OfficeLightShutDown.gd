extends Node3D

@export var OfficeMainLight: OmniLight3D
@export var getOfficeAnim: AnimationPlayer
var officeEnergy

var officeLightOn := true

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func _Shutdown_Office_Light():
	getOfficeAnim.play("light_off")
	officeLightOn = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayerVariables.powerShutdown_bool == true and officeLightOn == true:
		_Shutdown_Office_Light()
	pass
