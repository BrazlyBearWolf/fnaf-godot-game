extends Node

var power_int := 100

var timeSecs_f := 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Usage2.hide()
	$Usage3.hide()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	timeSecs_f = timeSecs_f - delta * PlayerVariables.powerUsage_int
	
	if PlayerVariables.powerUsage_int >1:
		$Usage2.show()
		
	if PlayerVariables.powerUsage_int >2:
		$Usage3.show()
		
	if PlayerVariables.powerUsage_int < 3:
		$Usage3.hide()
		
	if PlayerVariables.powerUsage_int < 2:
		$Usage2.hide()
	
	

	
	$RichTextLabel.text = "power: " + str(power_int) + "%"
	
	if PlayerVariables.powerShutdown_bool == false:
		
		if timeSecs_f <= 0:
			power_int = power_int - 1
			timeSecs_f = 5

	if power_int <=0:
		PlayerVariables.powerShutdown_bool = true
		$Usage1.hide()
		$Usage2.hide()
		$Usage3.hide()
	pass
