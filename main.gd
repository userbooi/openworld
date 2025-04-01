extends Node2D

var enemy = preload("res://enemy.tscn")

@export var randomVar = 10
@export var spawns: Array[Area2D]

var max_enemies = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_enemy()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_enemy() -> void:
	for spawn in spawns:
		var enemyNode = enemy.instantiate()
		enemyNode.scale = Vector2(0.3, 0.3)
		enemyNode.position = spawn.position
		
		add_child(enemyNode)


func _on_main_menu_start_game() -> void:
	$ColorRect.visible = false
	$Cutscenes.visible = false
	$MainMenu.visible = false
