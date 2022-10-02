extends CharacterBody2D

class_name Placeable

var _turret: Turret
var _can_drag: bool = false
var _BUFFER: int = 32

func is_turret(node: Node) -> bool:
	return node is Turret

func _ready() -> void:
	input_pickable = true
	var children = get_children()
	var turrets = children.filter(is_turret)
	if (turrets):
		_turret = turrets[0]
	pass


func _input(event: InputEvent) -> void:
	if not event is InputEventMouse:
		return
	if global_position.distance_to(event.global_position) > _BUFFER:
		#_can_drag = false
		return
	if event is InputEventMouseButton:
		_can_drag = event.pressed


func _process(delta: float) -> void:
	if not _can_drag:	return
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):	return
	position = get_global_mouse_position()

