extends Node2D

signal done

const ANIMATIONS: Array[String] = [
	'slide-down',
]


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func times_up() -> void:
	var i = randi_range(0, ANIMATIONS.size() - 1)
	$AnimationPlayer.play(ANIMATIONS[i])


func emit_finished() -> void:
	done.emit()

