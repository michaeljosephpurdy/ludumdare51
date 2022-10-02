extends Node2D

const _valid_positions: Array[Vector2] = [
	Vector2(20, 900), Vector2(80, 900), Vector2(140, 900),
	Vector2(20, 960), Vector2(80, 960), Vector2(140, 960),
	Vector2(20, 1020), Vector2(80, 1020), Vector2(140, 1020),
]

func _ready() -> void:
	Global.add_purchased_item(load('res://actors/turrets/basic-turret.tscn').instantiate())
	Global.add_purchased_item(load('res://actors/turrets/basic-turret.tscn').instantiate())
	Global.add_purchased_item(load('res://actors/turrets/basic-turret.tscn').instantiate())
	Global.add_purchased_item(load('res://actors/turrets/basic-turret.tscn').instantiate())
	Global.add_purchased_item(load('res://actors/turrets/basic-turret.tscn').instantiate())
	Global.add_purchased_item(load('res://actors/turrets/basic-turret.tscn').instantiate())
	unlock()
	pass


func _process(delta: float) -> void:
	pass


func lock() -> void:
	pass

func unlock() -> void:
	var turrets = Global.get_unplaced_items()
	for i in range(turrets.size()):
		var turret = turrets[i]
		var placeable = Placeable.new()
		placeable.add_child(turret)
		placeable.set_process_input(true)
		placeable.input_pickable = true
		add_child(placeable)
		placeable.position = _valid_positions[i]


func _on_parking_lot_body_exited(body):
	var turret = body as Turret
	print(str(body) + ' is unplaced')
	pass # Replace with function body.


func _on_parking_lot_body_entered(body):
	var turret = body as Turret
	print(str(body) + ' is unplaced')
	pass # Replace with function body.
