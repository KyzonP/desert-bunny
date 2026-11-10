extends ColorRect

func _ready():
	EventBus.bomb_activated.connect(bomb_activated)

func _physics_process(delta):
	if color.a > 0:
		color.a -= delta

func bomb_activated(_dir, _pos):
	color = Color(1,1,1,1)
