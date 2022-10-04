extends Node2D

@onready
var _skeleton = preload('res://actors/enemies/skeleton.tscn')
var _turrets: Array[Turret]

var _enemy_count = 0

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func spawn_skeleton() -> void:
	var skeleton = _skeleton.instantiate()
	_enemy_count += 1
	skeleton.id = _enemy_count
	$EnemyPath.add_child(skeleton)


func get_enemies() -> Array[Node]:
	return $EnemyPath.get_children()


func lock() -> void:
	$Timer.stop()
	for enemy in $EnemyPath.get_children():
		enemy.set_process(false)
	for turret in _turrets:
		turret.set_process(false)
		turret.toggle_timer(false)
	for child in self.get_children():
		child.set_process(false)


func unlock() -> void:
	_turrets = []
	var turrets = Global.get_turrets()
	for turret in turrets:
		if (turret.is_placed()):
			add_child(turret)
			_turrets.push_back(turret)
	$Timer.start()
	for enemy in $EnemyPath.get_children():
		enemy.set_process(true)
	for turret in _turrets:
		turret.visible = true
		turret.set_process(true)
		turret.toggle_timer(true)
	for child in self.get_children():
		child.set_process(true)



func _on_timer_timeout():
	spawn_skeleton()
	if (_enemy_count > 40):
		$Timer.wait_time = 3
	if (_enemy_count > 80):
		$Timer.wait_time = 2
