class_name Cross
extends Area2D
signal crossx


func _init() -> void:
	collision_layer = 0
	collision_mask = 0
	set_collision_mask_value(2, true )
	
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_excited)
	
func crox() -> void:
	print("jesui")
	
	get_tree().change_scene_to_file("res://lvl/node_2d.tscn")
	#crossx.emit()

func _on_body_entered(player:Chara) -> void:
	player.cross_with = self
func _on_body_excited(player:Chara) -> void:
	player.cross_with = null
