extends Node2D

var _expected_answer: int
var _first_operand: int
var _second_operand: int


func _ready() -> void:
	new_fact()


func _process(delta: float) -> void:
	pass


func new_fact() -> void:
	_first_operand = randi() % 10 
	_second_operand = randi() % 10 
	$VBoxContainer/TopNumber.set_text(str(_first_operand))
	$VBoxContainer/BottomNumber.set_text('+ ' + str(_second_operand))
	_expected_answer = _first_operand + _second_operand


func is_correct_answer(answer: int) -> bool:
	return _expected_answer == answer
