extends Camera2D

const BOUND_X_MIN = 0
const BOUND_X_MAX = 1920
const BOUND_Y_MIN = 0
const BOUND_Y_MAX = 1080

const CAMERA_LIMIT_X = 500
const CAMERA_LIMIT_Y = 500

#Get min and max bounds
const MIN_X = BOUND_X_MIN + CAMERA_LIMIT_X
const MIN_Y = BOUND_Y_MIN + CAMERA_LIMIT_Y
const MAX_X = BOUND_X_MAX - CAMERA_LIMIT_X
const MAX_Y = BOUND_Y_MAX - CAMERA_LIMIT_Y

func _edge():
	var camera = self.position

	if camera.x < MIN_X:
		camera.x = MIN_X
	if camera.x > MAX_X:
		camera.x = MAX_X
	if camera.y < MIN_Y:
		camera.y = MIN_Y
	if camera.y > MAX_Y:
		camera.y = MAX_Y

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
