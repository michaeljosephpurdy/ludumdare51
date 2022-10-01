extends Node

var _coin_count: int
var _debug: bool = true

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func is_debug_enabled() -> bool:
	return _debug

func add_coin() -> void:
	_coin_count += 1
	print('new coin_count ' + str(_coin_count))

func can_afford(cost: int) -> bool:
	return _coin_count - cost < 0


func deduct_cost(cost: int) -> void:
	assert(can_afford(cost), 'attempted to deduct_cost with too little coin')
	_coin_count = _coin_count- cost

