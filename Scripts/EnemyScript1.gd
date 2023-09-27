extends Node3D
class_name EnemyScript1

@export_category("Drag drop")

@export_group("Timers")
@export var attackTimer: Timer
@export var chanceTimer: Timer
@export var shutdownDeathTimer: Timer
@export_group("Location Arrays")
@export var moveLocations: Array[Transform3D]
@export var deathLocation: Transform3D
@export_category("Charateristics")
@export var aiLevel_int := 10


var newMoveIndex: int

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
	
	if PlayerVariables.powerShutdown_bool == true and shutdownDeathTimer.is_stopped():
		newMoveIndex += 1
		shutdownDeathTimer.start()
		print(newMoveIndex)
	
	if PlayerVariables.powerShutdown_bool == false:
		
		if newMoveIndex > 0:
			var randomForwardback: int
			
			randomForwardback = randi_range(0, randi_range(0, 1))
			
			match randomForwardback:
				0:
					newMoveIndex = newMoveIndex + randi_range(newMoveIndex, newMoveIndex + 1)
				1:
					newMoveIndex = newMoveIndex - 1
					
		else:
			newMoveIndex = newMoveIndex + 1
			
	if newMoveIndex > moveLocations.size() - 1:
		newMoveIndex = moveLocations.size() - 1
		
	moveIndex_int = newMoveIndex
	
	set_transform(moveLocations[moveIndex_int])
	
	print(moveIndex_int)
	if moveIndex_int == 2:
		initializeAttack_bool = true
		chanceTimer.stop()
		attackTimer.start()


func _Chance_To_Move():
	dice = randi_range(0, 20)
	chanceTimer.start()
	if dice < aiLevel_int:
		_Move_Enemy()
	else:
		pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

# when door is open and enemy is in door, enemy can attack after a certain time
	if attackTimer.is_stopped() \
	and PlayerVariables.isLeftDoorOpen_bool == true \
	and initializeAttack_bool == true:

		_Attack_Player()
	
# when door is closed and the enemy is there. the enemy goes to a starting position
	if attackTimer.is_stopped() \
	and initializeAttack_bool == true \
	and PlayerVariables.isLeftDoorOpen_bool == false:
		newMoveIndex = 0
		chanceTimer.start()
		attackTimer.stop()
		initializeAttack_bool = false
		set_transform(moveLocations[0])
	
# After every time the chance timer reaches 0 (and the enemy  isn't attacking) they have a chance to move
	if chanceTimer.is_stopped() and initializeAttack_bool == false:
		_Chance_To_Move()
	
