extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

enum STATES {IDLE, LOCKIN, ATTACK}

var state = STATES.IDLE
var direction = Vector2(-1, 0)

func _process(delta: float) -> void:
	$AnimatedSprite2D.play("walk")
	if direction.x >= 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false

func _physics_process(delta: float) -> void:
	if state == STATES.ATTACK:
		velocity = Vector2.ZERO
	else:
		velocity = direction * SPEED * delta * 6
		move_and_slide()


func _on_timer_timeout() -> void:
	if state == STATES.IDLE:
		var angle = gen_angle()
		direction = Vector2(cos(angle), sin(angle)).normalized()
	elif state == STATES.LOCKIN:
		follow_player()
		direction = direction.normalized()

func follow_player() -> void:
	direction = get_parent().get_node("Player").position - position

func gen_angle() -> float:
	var angle
	
	if randf() > 0.3:
		
		if direction.x >= 0:
			angle = randf_range(-PI/2, PI/2)
		else:
			angle = randf_range(PI/2, 3*PI/2)
		
	else:
		
		if direction.x <= 0:
			angle = randf_range(-PI/2, PI/2)
		else:
			angle = randf_range(PI/2, 3*PI/2)
			
	return angle


func _on_lock_in_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		state = STATES.LOCKIN

func _on_lock_in_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		state = STATES.IDLE

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		state = STATES.ATTACK
		
func _on_attack_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		state = STATES.LOCKIN
