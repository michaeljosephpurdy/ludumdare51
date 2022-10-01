extends Button

@export
var number: int

func _ready() -> void:
	self.text = str(number)
	pressed.connect(_button_pressed)


func _button_pressed() -> void:
	release_focus()

