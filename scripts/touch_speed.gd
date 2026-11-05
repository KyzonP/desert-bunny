extends Node2D

@onready var left_button = find_child("SpeedDown")
@onready var right_button = find_child("SpeedUp")

func _ready():
	left_button.pressed.connect(speed_down)
	right_button.pressed.connect(speed_up)

func speed_down():
	EventBus.emit_signal("speedDown")

func speed_up():
	EventBus.emit_signal("speedUp")
