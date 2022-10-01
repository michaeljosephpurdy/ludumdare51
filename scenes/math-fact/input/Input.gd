extends Node

signal input_submitted

const SPACE_STRING = ' '
const EMPTY_STRING = ''

const VALID_KEYS = [
	KEY_0,	KEY_1,	KEY_2,	KEY_3,
	KEY_4,	KEY_5,	KEY_6,
	KEY_7,	KEY_8,	KEY_9,
	KEY_ENTER,
	KEY_BACKSPACE,
]

const KEY_VALUE_MAP = {
	KEY_0: 0,
	KEY_1: 1,
	KEY_2: 2,
	KEY_3: 3,
	KEY_4: 4,
	KEY_5: 5,
	KEY_6: 6,
	KEY_7: 7,
	KEY_8: 8,
	KEY_9: 9,
	KEY_ENTER: 'SUBMIT',
	KEY_BACKSPACE: 'CLEAR',
}

var inputString: String
var locked: bool


func _ready():
	$InputContainer/Current.set_text(EMPTY_STRING)


func _process(delta):
	$InputContainer/Current.set_text(inputString)


func _input(ev):
	if not ev is InputEventKey or not KEY_VALUE_MAP.has(ev.keycode):
		return
	if ev.echo or not ev.pressed:
		return
	print(ev)
	if ev.keycode == KEY_ENTER:
		return _on_submit_pressed()
	if ev.keycode == KEY_BACKSPACE:
		return _on_clear_pressed()
	var number = KEY_VALUE_MAP.get(ev.keycode)
	_on_number_selected(number)


func _input_submitted(number):
	if locked: return
	print('submitted')
	self.input_submitted.emit(number)


func _on_submit_pressed():
	$InputContainer/Submit.release_focus()
	if locked: return
	if (inputString == SPACE_STRING or inputString == EMPTY_STRING):
		return
	var input = inputString.to_int()
	self.input_submitted.emit(input)
	_on_clear_pressed()


func _on_number_selected(number):
	if locked: return
	inputString += str(number)


func _on_clear_pressed():
	$InputContainer/Clear.release_focus()
	if locked: return
	inputString = SPACE_STRING
	print('cleared ' + inputString)


func lock():
	locked = true
	
func unlock():
	locked = false
