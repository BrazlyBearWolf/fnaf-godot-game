extends Node

var power = 3

@onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = 5
	timer.start()
	$Usage2.hide()
	$Usage3.hide()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	print(timer.time_left)
	
	timer.time_left *- PlayerVariables.powerUsage
	if PlayerVariables.powerUsage >1:
		$Usage2.show()
		timer.wait_time = 4
	if PlayerVariables.powerUsage >2:
		$Usage3.show()
		timer.wait_time = 2
	if PlayerVariables.powerUsage < 3:
		$Usage3.hide()
		timer.wait_time = 4
	if PlayerVariables.powerUsage < 2:
		$Usage2.hide()
		timer.wait_time = 5
	
	print(power)
	
	$RichTextLabel.text = "power: " + str(power) + "%"
	
	if PlayerVariables.powerShutdown == false:
		
		if timer.is_stopped():
			power = power - 1
			timer.start()

	if power <=0:
		PlayerVariables.powerShutdown = true
		$Usage1.hide()
		$Usage2.hide()
		$Usage3.hide()
	pass
