extends Node2D

@onready var left_button = find_child("RollLeft")
@onready var right_button = find_child("RollRight")

func _ready():
	left_button.pressed.connect(roll_left)
	right_button.pressed.connect(roll_right)

func roll_left():
	EventBus.emit_signal("touchRoll", "Left")

func roll_right():
	EventBus.emit_signal("touchRoll", "Right")
