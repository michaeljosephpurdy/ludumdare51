extends Node

signal fire

func _input_submitted(number):
	self.fire.emit(number)
