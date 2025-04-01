extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

enum STATES {IDLE, LOCKIN, ATTACK}

var state = STATES.IDLE
var direction = Vector2(-1, 0)

func _physics_process(delta: float) -> void:

	velocity = direction * SPEED * delta * 6

	move_and_slide()


func _on_timer_timeout() -> void:
	gen_angle()

func gen_angle() -> void:
	var angle
		
	
	if randf() > 0.3:
		
		if direction.x >= 0:
			angle = randf_range(-PI/2, PI/2)
		else:
			angle = randf_range(PI/2, 3*PI/2)
		
	else:
		pass
