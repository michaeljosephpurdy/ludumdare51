extends Node2D

signal purchased(Turret)

var _item: Turret

func _ready() -> void:
	for child in get_children():
		if child is Turret:
			_item = child
	$HBoxContainer/VBoxContainer/CostLabel.text = 'cost: ' + str(_item.cost)
	$HBoxContainer/VBoxContainer/DamageLabel.text = 'damage: ' + str(_item.damage)
	$HBoxContainer/VBoxContainer/RadiusLabel.text = 'range: ' + str(_item.radius)
	$HBoxContainer/VBoxContainer/FireRateLabel.text = 'speed: ' + str(_item.fire_rate)

func _process(delta: float) -> void:
	$HBoxContainer/BuyButton.disabled = not Global.can_afford(_item.cost)


func _on_buy_button_pressed():
	purchased.emit(_item)

