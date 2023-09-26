extends Node2D


@export var countDownTimer: Timer

#var countDownTimer = PlayerVariables.countDownTimer

const amNumber_ArrayInt := [12, 1, 2, 3, 4, 5, 6]

var index_int := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	countDownTimer.start()
	pass # Replace with function body.

func _Set_Time():
	$RichTextLabel.text = str(amNumber_ArrayInt[index_int]) + " am"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if countDownTimer.is_stopped():
		index_int = index_int + 1
		countDownTimer.start()
		pass

		
	if PlayerVariables.isDead_bool == true:
		countDownTimer.set_paused(PlayerVariables.isDead_bool)
		
		
	match index_int:
		0:
			_Set_Time()
		1: 
			_Set_Time()
		2:
			_Set_Time()
		3:
			_Set_Time()
		4:
			_Set_Time()			
		5:
			_Set_Time()
		6:
			_Set_Time()
			get_tree().change_scene_to_file("res://Scenes/Win.tscn")
	
	pass
