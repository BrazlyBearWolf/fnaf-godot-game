extends Control

@export var hint: Array[RichTextLabel]

var hintIndex := 0
var hint1 = false
var hint2 = false
@export var timer: Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in hint.size():
		hint[i].hide()
		hint[hintIndex].show()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("ToggleLeftDoor") \
	or Input.is_action_just_pressed("ToggleRightDoor"):
		if hint1 == false:
			hintIndex += 1
		hint1 = true
	
	if PlayerVariables.isLeftDoorOpen_bool == false \
	or PlayerVariables.isRightDoorOpen_bool == false:
		if hint1 == true and hint2 == false:
			hintIndex += 1
			hint2 = true
			timer.start()
		
		if hint1 == true and hint2 == true and timer.is_stopped():
			hintIndex += 1
			timer.start()
			if timer.is_stopped():
				hintIndex = -1
				for i in hint.size():
					hint[i].hide()
		
	match hintIndex:
		0:
			for i in hint.size():
				hint[i].hide()
				hint[hintIndex].show()
				
		1:  for i in hint.size():
				hint[i].hide()
				hint[hintIndex].show()
				
		2:  for i in hint.size():
				hint[i].hide()
				hint[hintIndex].show()
		_: for i in hint.size():
					hint[i].hide()
		
	pass
