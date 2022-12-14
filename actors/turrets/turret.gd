extends Node2D

class_name Turret

const _STATS_MAP = [
	# Pepperoni
	{
		'fire_rate': 0.4,
		'damage': 3,
		'radius': 300,
		'cost': 5,
	},
	# Sauce
	{
		'fire_rate': 0.2,
		'damage': 0.5,
		'radius': 300,
		'cost': 10,
		'immobile': true,
	},
	# Dough
	{
		'fire_rate': 0.4,
		'damage': 8,
		'radius': 300,
		'cost': 14,
	},
]

@export_enum("Pepperoni", "Sauce", "Dough")
var type: int
@export
var texture: Texture2D
@export
var projectile: Node2D

var _id: int
var _fire_rate: float
var _radius: int
var _cost: int
var _damage: int
var _immobile: bool
var _target: Enemy
var _type: Global.TurretType
var _placed: bool

func _ready() -> void:
	_id = randi()
	_type = type as Global.TurretType
	var stats = _STATS_MAP[_type]
	_fire_rate = stats.get('fire_rate')
	_radius = stats.get('radius')
	_cost= stats.get('cost')
	_damage = stats.get('damage')
	_immobile = stats.get('immobile') or false
	$Timer.wait_time = _fire_rate
	$Detector.scale.x = _radius
	$Detector.scale.y = _radius
	assert(texture)
	if (texture):
		$Sprite.texture = texture


func _process(dela: float) -> void:
	if _target == null:
		var potential_targets = detect_target()
		if potential_targets.is_empty():	return
		for target in potential_targets:
			if global_position.distance_to(target.global_position) <= _radius:
				_target = target
				print('assigned target')
		return
	if global_position.distance_to(_target.global_position) >= _radius:
		_target = null
		print('removed target')
		return
	if not _immobile:
		look_at(_target.position)


func toggle_timer(should_run: bool) -> void:
	if (should_run):
		$Timer.start()
	else:
		$Timer.stop()

func detect_target() -> Array[Enemy]:
	var children = []
	if get_parent().has_method('get_enemies'):
		children = get_parent().get_enemies()
	var targets = []
	for child in children:
		if (child is Enemy):
			if global_position.distance_to(child.global_position) <= _radius:
				targets.push_back(child)
	return targets


func _on_timer_timeout() -> void:
	print('timer!')
	if _target == null:	return
	var new_projectile = projectile.duplicate()
	if new_projectile == null:
		return
	var bullet: Projectile = new_projectile as Projectile
	get_parent().add_child(bullet)
	bullet.position = self.position
	bullet.set_target(_target)
	bullet.hit_target.connect(_on_bullet_hit.bind(_target))
	bullet.fire()


func _on_bullet_hit(bullet_target: Enemy) -> void:
	bullet_target.inflict_damage(_damage)

func get_cost() -> int:
	return _cost

func mark_as_placed() -> void:
	_placed = true

func is_placed() -> bool:
	return _placed
