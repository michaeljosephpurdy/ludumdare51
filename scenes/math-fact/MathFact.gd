extends Node2D

var expected_answer: int
var first_operand: int
var second_operand: int
const operator: String = '+'


func _ready():
	new_fact()


func _process(delta):
	pass


func new_fact():
	first_operand = randi() % 10 
	second_operand = randi() % 10 
	$VBoxContainer/TopNumber.set_text(str(first_operand))
	$VBoxContainer/BottomNumber.set_text('+ ' + str(second_operand))
	expected_answer = first_operand + second_operand


func is_correct_answer(answer):
	return expected_answer == answer
