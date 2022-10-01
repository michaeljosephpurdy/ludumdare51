extends Node2D

@onready
var _skeleton = load('res://actors/enemies/skeleton.tscn')
var _enemies: Array[Enemy] = []


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	for enemy in _enemies:
		if is_instance_valid(enemy):
			enemy.translate(Vector2(0, enemy.speed) * delta)


func spawn_skeleton() -> void:
	var skeleton = _skeleton.instantiate()
	add_child(skeleton)
	_enemies.push_back(skeleton)


func _input(ev):
	if not ev is InputEventKey or ev.echo or not ev.pressed:
		return
	if ev.keycode == KEY_SPACE:
		spawn_skeleton()

