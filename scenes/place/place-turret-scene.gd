extends Node2D

const _valid_positions: Array[Vector2] = [
	Vector2(20, 900), Vector2(80, 900), Vector2(140, 900),
	Vector2(20, 960), Vector2(80, 960), Vector2(140, 960),
	Vector2(20, 1020), Vector2(80, 1020), Vector2(140, 1020),
]

var _placeables: Array[Placeable]
var _turrets: Array[Turret]

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func lock() -> void:
	set_process_input(false)
	var turrets = _turrets
	for i in range(_placeables.size()):
		var placeable = _placeables[i]
		var position = placeable.position
		var turret: Turret = placeable.get_turret()
		if (turret.is_placed()):
			continue
		if (placeable.position != _valid_positions[i]): #not placed
			turret.mark_as_placed()
			
		turret.position = placeable.position
		turrets.push_back(turret)
		placeable.queue_free()
	for turret in turrets:
		var parent = turret.get_parent()
		if (parent != null):
			parent.remove_child(turret)
	Global.set_turrets(turrets)


func unlock() -> void:
	set_process_input(true)
	_placeables = []
	_turrets = []
	var turrets = Global.get_turrets()
	for i in range(turrets.size()):
		var turret = turrets[i]
		var parent = turret.get_parent()
		if (parent != null):
			parent.remove_child(turret)
		if (turret.is_placed()):
			add_child(turret)
			_turrets.push_back(turret)
		else:
			var placeable = Placeable.new()
			placeable.add_child(turret)
			placeable.set_process_input(true)
			placeable.input_pickable = true
			add_child(placeable)
			_placeables.push_back(placeable)
			placeable.position = Vector2(randi_range(20, 140), randi_range(900, 1020))


func _on_parking_lot_area_entered(area):
	var turret = (area.get_parent() as Placeable).get_turret()
	print(str(turret) + ' is unplaced')


func _on_parking_lot_area_exited(area):
	var turret = (area.get_parent() as Placeable).get_turret()
	print(str(turret) + ' is placed')
