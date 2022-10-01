extends Container

var input: String
var parsedInput: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_submit_pressed():
	parsedInput = input.to_int()
	print('submit button pressed')
	print(parsedInput)
	pass # Replace with function body.

func _on_key_container_number_selected(number):
	input += str(number)

func _on_clear_pressed():
	input = ''
