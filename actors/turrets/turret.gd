extends Node2D

class_name Turret

@export
var texture: Texture2D
@export
var projectile: Node2D
@export
var fire_rate: float = 0.4
@export
var damage: int = 1
@export
var radius: int = 300

var _target: Enemy


func _ready() -> void:
	$Timer.start(fire_rate)
	$Detector.scale.x = radius
	$Detector.scale.y = radius
	assert(texture)
	if (texture):
		$Sprite.texture = texture


func _process(dela: float) -> void:
	if _target == null:
		var potential_targets = detect_target()
		if potential_targets.is_empty():	return
		for target in potential_targets:
			if global_position.distance_to(target.global_position) <= radius:
				_target = target
				print('assigned target')
		return
	if global_position.distance_to(_target.position) >= radius:
		_target = null
		print('removed target')
		return
	look_at(_target.position)


func detect_target() -> Array[Enemy]:
	var children = get_parent().get_children()
	var targets = []
	for child in children:
		if (child is Enemy):
			targets.push_back(child)
	return targets


func _on_timer_timeout() -> void:
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
	bullet_target.inflict_damage(damage)
