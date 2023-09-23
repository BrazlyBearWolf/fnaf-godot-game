extends Node

var power = 100

var timeSecs = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	$Usage2.hide()
	$Usage3.hide()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	timeSecs = timeSecs - delta * PlayerVariables.powerUsage
	
	if PlayerVariables.powerUsage >1:
		$Usage2.show()
		
	if PlayerVariables.powerUsage >2:
		$Usage3.show()
		
	if PlayerVariables.powerUsage < 3:
		$Usage3.hide()
		
	if PlayerVariables.powerUsage < 2:
		$Usage2.hide()
	
	

	
	$RichTextLabel.text = "power: " + str(power) + "%"
	
	if PlayerVariables.powerShutdown == false:
		
		if timeSecs <= 0:
			power = power - 1
			timeSecs = 5

	if power <=0:
		PlayerVariables.powerShutdown = true
		$Usage1.hide()
		$Usage2.hide()
		$Usage3.hide()
	pass
