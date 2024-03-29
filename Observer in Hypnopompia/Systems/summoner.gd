extends Node2D

#others will be added
enum typsummon_entity {Inverted, White, Black, InvertedBullet, WhiteB, DarkB}

const COLOR_INVERTED_BULLET = preload("res://Enemies/Invert Bullet/color_inverted_bullet.tscn")
const ENEMY = preload("res://Enemies/First Section Enemies/enemy.tscn")



@export var inverted_layer : Node2D
@export var default_layer : Node2D
@export var second_sequence_layer : Node2D

var summon_markers := []
	
func _ready():
	summon_markers.append_array(get_children())
	
func summon(s_index : int, s_type : typsummon_entity) -> void:
	match s_type:
		typsummon_entity.Inverted:
			var n_enemy = ENEMY.instantiate()
			n_enemy.global_position = get_child(s_index).global_position
			inverted_layer.add_child(n_enemy)
		typsummon_entity.White:
			var n_enemy = ENEMY.instantiate()
			n_enemy.global_position = get_child(s_index).global_position
			default_layer.add_child(n_enemy)
		typsummon_entity.Black:
			var n_enemy = ENEMY.instantiate()
			n_enemy.global_position = get_child(s_index).global_position
			n_enemy.color_type = 1
			default_layer.add_child(n_enemy)
			
		typsummon_entity.InvertedBullet:
			var n_enemy = COLOR_INVERTED_BULLET.instantiate()
			n_enemy.global_position = get_child(s_index).global_position
			inverted_layer.add_child(n_enemy)
		typsummon_entity.WhiteB:
			var n_enemy = COLOR_INVERTED_BULLET.instantiate()
			n_enemy.global_position = get_child(s_index).global_position
			default_layer.add_child(n_enemy)
		typsummon_entity.DarkB:
			var n_enemy = COLOR_INVERTED_BULLET.instantiate()
			n_enemy.global_position = get_child(s_index).global_position
			n_enemy.color_type = 1
			default_layer.add_child(n_enemy)

func summon_on_all(s_type : typsummon_entity, amount := get_children().size()) -> void:
	for i in amount:
		summon(i, s_type)
