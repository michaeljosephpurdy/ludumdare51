extends Node2D

class_name Projectile

const _STATS_MAP = [
	# Pepperoni
	{
		'speed': 400,
	},
	# Sauce
	{
		'speed': 400,
	},
	# Dough
	{
		'speed': 400,
	},
]


signal hit_target
@export
var texture: Texture2D
@export_enum('Pepperoni', 'Sauce', 'Dough')
var type: int

var _fired: bool
var _destination: Vector2
var _type: Global.ProjectileType
var _speed: int


func _ready() -> void:
	$Sprite.texture = texture
	_type = type as Global.ProjectileType
	var stats = _STATS_MAP[_type]
	_speed = stats.get('speed')


func _process(delta: float) -> void:
	if not _fired or _destination == null:	return
	var velocity = position.direction_to(_destination) * 10
	position += velocity.normalized() * _speed * delta
	if global_position.distance_to(_destination) <= 5:
		hit_target.emit()
		queue_free()


func set_target(target: Enemy) -> void:
	look_at(target.position)
	_destination = target.position

func fire() -> void:
	$Sprite.visible = true
	_fired = true
