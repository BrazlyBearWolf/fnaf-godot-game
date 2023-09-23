extends Node2D


var timer = 0

@onready var countDownTimer = $Timer

var amNumber = [12, 1, 2, 3, 4, 5, 6]


var i = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	countDownTimer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if countDownTimer.is_stopped():
		i = i + 1
		countDownTimer.start()
		pass

		
	match i:
		0:
			$RichTextLabel.text = str(amNumber[i]) + " am"
		1: 
			$RichTextLabel.text = str(amNumber[i]) + " am"
		2:
			$RichTextLabel.text = str(amNumber[i]) + " am"
		3:
			$RichTextLabel.text = str(amNumber[i]) + " am"
		4:
			$RichTextLabel.text = str(amNumber[i]) + " am"
		5:
			$RichTextLabel.text = str(amNumber[i]) + " am"
		6:
			$RichTextLabel.text = str(amNumber[i]) + " am"
			get_tree().change_scene_to_file("res://Scenes/Win.tscn")
	
	pass
