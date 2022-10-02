extends Node2D

class_name Projectile

signal hit_target
@export
var speed: int = 600

var _fired: bool
var _destination: Vector2


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if not _fired or _destination == null:	return
	var velocity = position.direction_to(_destination) * 10
	position += velocity.normalized() * speed * delta
	if global_position.distance_to(_destination) <= 5:
		hit_target.emit()
		queue_free()


func set_target(target: Enemy) -> void:
	look_at(target.position)
	_destination = target.position

func fire() -> void:
	$Sprite.visible = true
	_fired = true
