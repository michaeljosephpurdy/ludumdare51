extends Node2D

@onready
var _skeleton = preload('res://actors/enemies/skeleton.tscn')
var _turrets: Array[Turret]

var _enemy_count = 0

func _ready() -> void:
	unlock()
	_turrets.push_back($PepperoniTurret)
	pass


func _process(delta: float) -> void:
	pass


func spawn_skeleton() -> void:
	var skeleton = _skeleton.instantiate()
	_enemy_count += 1
	skeleton.id = _enemy_count
	$EnemyPath.add_child(skeleton)


func _input(ev) -> void:
	if not ev is InputEventKey or ev.echo or not ev.pressed:
		return
	if ev.keycode == KEY_SPACE:
		spawn_skeleton()


func get_enemies() -> Array[Node]:
	return $EnemyPath.get_children()


func lock() -> void:
	for enemy in $EnemyPath.get_children():
		enemy.set_process(false)
	for turret in _turrets:
		turret.set_process(false)
		turret.toggle_timer(false)
	for child in self.get_children():
		child.set_process(false)


func unlock() -> void:
	for enemy in $EnemyPath.get_children():
		enemy.set_process(true)
	for turret in _turrets:
		turret.set_process(true)
		turret.toggle_timer(true)
	for child in self.get_children():
		child.set_process(true)

