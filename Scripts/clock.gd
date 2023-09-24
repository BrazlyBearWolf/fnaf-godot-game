extends Node2D


@export var countDownTimer: Timer

const amNumber_ArrayInt := [12, 1, 2, 3, 4, 5, 6]

var index_int := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	countDownTimer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if countDownTimer.is_stopped():
		index_int = index_int + 1
		countDownTimer.start()
		pass

		
	match index_int:
		0:
			$RichTextLabel.text = str(amNumber_ArrayInt[index_int]) + " am"
		1: 
			$RichTextLabel.text = str(amNumber_ArrayInt[index_int]) + " am"
		2:
			$RichTextLabel.text = str(amNumber_ArrayInt[index_int]) + " am"
		3:
			$RichTextLabel.text = str(amNumber_ArrayInt[index_int]) + " am"
		4:
			$RichTextLabel.text = str(amNumber_ArrayInt[index_int]) + " am"
		5:
			$RichTextLabel.text = str(amNumber_ArrayInt[index_int]) + " am"
		6:
			$RichTextLabel.text = str(amNumber_ArrayInt[index_int]) + " am"
			get_tree().change_scene_to_file("res://Scenes/Win.tscn")
	
	pass
