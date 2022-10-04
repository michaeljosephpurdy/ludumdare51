extends Node2D

signal finished

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

func unlock() -> void:
	$AnimationPlayer.play('intro')
	pass


func lock() -> void:
	pass

func _on_skip_button_pressed() -> void:
	finished.emit()
