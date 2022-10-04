extends CharacterBody2D

class_name Placeable

var _turret: Turret
var _can_drag: bool = false
var _BUFFER: int = 20

func is_turret(node: Node) -> bool:
	return node is Turret

func _ready() -> void:
	input_pickable = true
	var children = get_children()
	var turrets = children.filter(is_turret)
	if (turrets):
		_turret = turrets[0]
		_turret.position = Vector2(0, 0)
	pass


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton :
		if (event.position.distance_to(position) <= _BUFFER):
			_can_drag = event.pressed


func _process(delta: float) -> void:
	if not _can_drag:	return
	#if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):	return
	position = get_global_mouse_position()


func get_turret() -> Turret:
	return _turret
