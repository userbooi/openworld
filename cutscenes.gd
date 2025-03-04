extends Node2D
var cutscene_num = 10
signal startMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.self_modulate.a = 1
	$Label.self_modulate.a = 1
	$UserPrompt.self_modulate.a = 1
	$ColorRect.self_modulate.a = 1
	
	start_animation()
	
func start_animation():
	$AnimationPlayer.play("fade_out")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("advanceCutscene"):
		cutscene_num += 1
		continue_animation()
		
func continue_animation():
	$AnimationPlayer.play("fade_in")
	await get_tree().create_timer(2).timeout
	changeCutscene()
	$AnimationPlayer.play("fade_out")
	

func changeCutscene():
	if cutscene_num == 1:
		$Sprite2D.texture = ResourceLoader.load("res://Art/scene1.png")
		$Label.text = "Test STory 101"
		$Sprite2D.self_modulate.a = 1
		$Label.self_modulate.a = 1
		$UserPrompt.self_modulate.a = 1
		
	elif cutscene_num == 2:
		$Sprite2D.texture = ResourceLoader.load("res://Art/scene2.png")
		$Label.text = "Test narration 202"
		
	elif cutscene_num == 3:
		$Sprite2D.texture = ResourceLoader.load("res://Art/scene3.png")
		$Label.text = "Test annecdote 303"
		
	elif cutscene_num == 4:
		$Sprite2D.texture = ResourceLoader.load("res://Art/scene4.png")
		$Label.text = "Test tale 404"
		
	elif cutscene_num == 5:
		$Sprite2D.texture = ResourceLoader.load("res://Art/scene5.png")
		$Label.text = "Test journey 505"
	
	else:
		$Sprite2D.self_modulate.a = 0
		$Label.self_modulate.a = 0
		$UserPrompt.self_modulate.a = 0
		startMenu.emit()
		
		
