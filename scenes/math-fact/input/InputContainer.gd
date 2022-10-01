extends Container

signal submitted_input

const EMPTY_STRING: String = ' '

var inputString: String
var inputInt: int

func _ready():
	$Submitted.set_text(EMPTY_STRING)
	_on_clear_pressed()


func _process(delta):
	$Current.set_text(inputString)


func _on_submit_pressed():
	if (inputString == EMPTY_STRING):
		return
	inputInt = inputString.to_int()
	print(inputInt)
	_on_clear_pressed()
	$Submitted.set_text(str(inputInt))
	self.submitted_input.emit(inputInt)


func _on_key_container_number_selected(number):
	inputString += str(number)


func _on_clear_pressed():
	inputString = EMPTY_STRING

