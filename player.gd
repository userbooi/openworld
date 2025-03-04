extends CharacterBody2D


const SPEED = 200.0
var facing = "S"

func _ready() -> void:
	$Camera2D.enabled = false

func _process(delta: float) -> void:
	if velocity == Vector2.ZERO:
		if facing == "S":
			$AnimatedSprite2D.play("idleS")
		elif facing == "N":
			$AnimatedSprite2D.play("idleN")
		elif facing == "W":
			$AnimatedSprite2D.play("idleW")
		elif facing == "E":
			$AnimatedSprite2D.play("idleE")
	else:
		if facing == "S":
			$AnimatedSprite2D.play("walkS")
		elif facing == "N":
			$AnimatedSprite2D.play("walkN")
		elif facing == "W":
			$AnimatedSprite2D.play("walkW")
		elif facing == "E":
			$AnimatedSprite2D.play("walkE")

func _physics_process(delta: float) -> void:
	var dew := Input.get_axis("left", "right")
	var dns := Input.get_axis("up", "down")
	
	if dew:
		if dew < 0:
			facing = "W"
		else:
			facing = "E"
		velocity.x = dew
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if dns:
		if dns < 0:
			facing = "N"
		else:
			facing = "S"
		velocity.y = dns
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	velocity = velocity.normalized() * SPEED

	move_and_slide()


func _on_main_menu_start_game() -> void:
	$Camera2D.enabled = true
