extends Node

enum TurretType {
	Pepperoni, Sauce, Dough
}

enum ProjectileType {
	Pepperoni, Sauce, Dough
}

enum State {
	MATH_FACT,
	BUY_STAGE,
	PLACE_STAGE,
	DEFEND,
	MAIN_MENU,
	GAME_OVER,
	TITLE,
}

var TIME: float = 10.0
var ZOMBIES: int = 100

var _zombies_killed: int
var _coin_count: int = 200
var _debug: bool = true
var _current_state: State = State.DEFEND
var _previous_state: State
var _turrets: Array[Turret] =[]

var _items_to_place: Array[Turret] = []

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

func is_debug_enabled() -> bool:
	return _debug


## Money
func add_coin() -> void:
	_coin_count += 1
	print('new coin_count ' + str(_coin_count))

func get_coin() -> int:
	return _coin_count

func can_afford(cost: int) -> bool:
	return _coin_count - cost >= 0

func deduct_cost(cost: int) -> void:
	assert(can_afford(cost), 'attempted to deduct_cost with too little coin')
	_coin_count = _coin_count- cost


## Turrets

func add_purchased_item(item: Turret) -> void:
	_turrets.push_back(item)

func get_unplaced_items() -> Array[Turret]:
	return _items_to_place

func set_turrets(turrets: Array[Turret]) -> void:
	_turrets = turrets

func get_turrets() -> Array[Turret]:
	return _turrets

## State
func get_current_state() -> int:
	return _current_state

func get_previous_state() -> int:
	return _previous_state

func set_next_state(state: State) -> void:
	_previous_state = _current_state
	_current_state = state


## Stats

func zombie_killed() -> void:
	_zombies_killed += 1

func zombies_left() -> int:
	return ZOMBIES - _zombies_killed

