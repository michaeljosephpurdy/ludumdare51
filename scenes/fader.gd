extends Node2D

signal fade_in_finished
signal fade_out_finished

func _ready() -> void:
	$ColorRect.color = Color(0, 0, 0, 0)


func _process(delta: float) -> void:
	pass


func fade_in() -> void:
	$AnimationPlayer.play('fade-in')


func fade_out() -> void:
	$AnimationPlayer.play('fade-out')


func emit_fade_in_finished() -> void:
	fade_in_finished.emit()

func emit_fade_out_finished() -> void:
	fade_out_finished.emit()
