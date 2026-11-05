extends Node2D

var radiusJoyStick
var radiusJoyBase
var maxLength
var doubleLength

var touchInsideJoyStick : bool = false

var held : bool = false
var posOffset = Vector2.ZERO
var lastMousePos = Vector2.ZERO

var releaseToggle : bool = false

@onready var button = find_child("TouchScreenButton")
@onready var base = find_child("JoystickBase")

func _ready():
	$TouchScreenButton.pressed.connect(_on_pressed)
	$TouchScreenButton.released.connect(_on_released)
	
	radiusJoyStick = 38
	radiusJoyBase = 60
	
	maxLength = radiusJoyBase - radiusJoyStick
	doubleLength = maxLength * 2
	
	posOffset = position + Vector2(-60,-60)
	
func _physics_process(_delta):
	if held:
		if releaseToggle:
			releaseToggle = false
		
		var relative = get_global_mouse_position() - lastMousePos
		lastMousePos = get_global_mouse_position()
		
		button.position.x = button.position.x + relative.x
		button.position.y = button.position.y + relative.y
		if button.position.length() > maxLength:
			var angle = button.position.angle()
			button.position.x = (cos(angle) * maxLength)
			button.position.y = (sin(angle) * maxLength)
		EventBus.joystickMoved.emit(button.position)

	else:
		button.position.x = 0
		button.position.y = 0
		lastMousePos = posOffset
		if not releaseToggle:
			releaseToggle = true
			EventBus.joystickReleased.emit()

func _on_pressed():
	held = true
	#base.visible = false

func _on_released():
	held = false
	#base.visible = true
