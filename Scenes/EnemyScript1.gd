extends Node3D

@export_category("Drag drop")

@export_group("Timers")
@export var attackTimer: Timer
@export var chanceTimer: Timer
@export_group("Location Arrays")
@export var moveLocations: Array[Transform3D]
@export var deathLocation: Transform3D
@export_category("Charateristics")
@export var aiLevel_int := 10



var dice: int
var moveIndex_int :=0
var initializeAttack_bool := false


# Called when the node enters the scene tree for the first time.
func _ready():
	set_transform(moveLocations[0])

	pass # Replace with function body.

func _Attack_Player():
	PlayerVariables.isDead_bool = true
	get_tree().change_scene_to_file("res://Scenes/death.tscn")

func _Move_Enemy():
	

	moveIndex_int = randi_range(0, moveLocations.size() - 1)
	
	set_transform(moveLocations[moveIndex_int])
	
	print(moveIndex_int)
	if moveIndex_int == 2:
		initializeAttack_bool = true
		chanceTimer.stop()
		attackTimer.start()

		
			
	pass
	


func _Chance_To_Move():
	dice = randi_range(0, 20)
	chanceTimer.start()
	print("chance to move")
	if dice < aiLevel_int:
		_Move_Enemy()
		print("success")
	else:
		pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	
	if attackTimer.is_stopped() \
	and PlayerVariables.isLeftDoorOpen_bool == true \
	and initializeAttack_bool == true:
		
		_Attack_Player()
	
	if attackTimer.is_stopped() and PlayerVariables.isLeftDoorOpen_bool == false:
		
		chanceTimer.start()
		attackTimer.stop()
		initializeAttack_bool = false
		set_transform(moveLocations[0])
	
	if chanceTimer.is_stopped() and initializeAttack_bool == false:
		_Chance_To_Move()
	
