extends Node2D

@onready var shoot_button = find_child("TouchFire")
@onready var bomb_button = find_child("TouchBomb")

@onready var bomb_text = find_child("BombText")

func _ready():
	shoot_button.pressed.connect(_fire)
	bomb_button.pressed.connect(_bomb)
	
	EventBus.removeBomb.connect(remove_bomb)

func _fire():
	EventBus.touchFire.emit()

func _bomb():
	EventBus.touchBomb.emit()

func remove_bomb():
	bomb_button.queue_free()
	bomb_text.queue_free()
