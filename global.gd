extends Node


var _coin_count: int

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func addCoin() -> void:
	_coin_count += 1
	print('new coin_count ' + str(_coin_count))

func canAfford(cost: int) -> bool:
	return _coin_count - cost < 0

