extends PathFollow3D

@export var maxSpeed : float = 30.0
@export var baseSpeed : float = 20.0
@export var minSpeed : float = 10.0

@export var acceleration : float = 10.0
@export var deceleration : float = 10.0

var speed : float = 10.0

var stopped : bool = false

var mobile : bool = false
var mobileSpeed : int = 0

func _ready():
	EventBus.give_speed.emit(self)
	EventBus.player_dead.connect(_stop)
	EventBus.speedDown.connect(mobile_speed_down)
	EventBus.speedUp.connect(mobile_speed_up)

func _physics_process(delta):
	if not stopped and not mobile:
		if Input.is_action_pressed("boost"):
			speed = move_toward(speed, maxSpeed, delta * acceleration)
		elif Input.is_action_pressed("brake"):
			speed = move_toward(speed, minSpeed, delta * deceleration)
		else:
			speed = move_toward(speed, baseSpeed, delta * deceleration)
			
		progress += delta * speed
	elif not stopped and mobile:
		if mobileSpeed == 1:
			speed = move_toward(speed, maxSpeed, delta * acceleration)
		elif mobileSpeed == 0:
			speed = move_toward(speed, baseSpeed, delta * deceleration)
		elif mobileSpeed == -1:
			speed = move_toward(speed, minSpeed, delta * deceleration)
		
		progress += delta * speed
	else:
		speed = move_toward(speed, 0, delta * deceleration)
		
func _stop():
	stopped = true
	
func mobile_speed_up():
	if mobileSpeed < 1:
		mobileSpeed += 1
		
	if not mobile:
		mobile = true
	
func mobile_speed_down():
	if mobileSpeed > -1:
		mobileSpeed -=1
		
	if not mobile:
		mobile = true
