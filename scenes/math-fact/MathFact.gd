extends Node2D

var expected_answer: int
var first_operand: int
var second_operand: int
const operator: String = '+'


func _ready() -> void:
	new_fact()


func _process(delta: float) -> void:
	pass


func new_fact() -> void:
	first_operand = randi() % 10 
	second_operand = randi() % 10 
	$VBoxContainer/TopNumber.set_text(str(first_operand))
	$VBoxContainer/BottomNumber.set_text('+ ' + str(second_operand))
	expected_answer = first_operand + second_operand


func is_correct_answer(answer: int) -> bool:
	return expected_answer == answer
