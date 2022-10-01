extends Button

@export
var number: int

func _ready():
	self.text = str(number)
	pressed.connect(_button_pressed)

func _button_pressed():
	release_focus()
