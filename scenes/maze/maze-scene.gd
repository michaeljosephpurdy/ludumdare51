extends Node2D

@onready
var _skeleton = preload('res://actors/enemies/skeleton.tscn')

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	for enemy in $EnemyPath.get_children():
		print(enemy.global_position)
	pass


func spawn_skeleton() -> void:
	var skeleton = _skeleton.instantiate()
	$EnemyPath.add_child(skeleton)


func _input(ev):
	if not ev is InputEventKey or ev.echo or not ev.pressed:
		return
	if ev.keycode == KEY_SPACE:
		spawn_skeleton()


func get_enemies():
	return $EnemyPath.get_children()
