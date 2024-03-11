extends CharacterBody3D
class_name Character

const _NORMAL_SPEED: float = 5.0
const _SPRINT_SPEED: float = 9.0

var _current_speed: float

@export_category("Objects")
@export var _body: Node3D = null
@export var _spring_arm_offset: Node3D = null

func _physics_process(_delta:float) -> void:
	_move()
	move_and_slide()
	
func _move() -> void:
	var _input_direction: Vector2 = Input.get_vector(
		"move_left","move_right",
		"move_forward","move_backward",	
	)
	
	var _direction: Vector3 = transform.basis * Vector3(
		_input_direction.x,
		0,
		_input_direction.y	
	).normalized()
	
	is_running()
	velocity.x = _direction.x * _current_speed
	velocity.z = _direction.z * _current_speed
	
func is_running() -> bool:
	if Input.is_action_pressed("shift"):
		_current_speed = _SPRINT_SPEED
		return true
	_current_speed = _NORMAL_SPEED
	return false
