extends CharacterBody2D

const box_pieces = preload("res://Itens/pieces_box.tscn")
const coin_instance = preload("res://Itens/rigid_coin.tscn")

@onready var animation_box_bk := $animation_bk as AnimationPlayer
@onready var spawn_coin := $spawn_coin as Marker2D
@onready var hit_block: AudioStreamPlayer = $hit_block

@export var pieces : PackedStringArray
@export var hitpoints := 3
var impulse := 250

func break_sprite():
	for piece in pieces.size():
		var piece_instance = box_pieces.instantiate()
		get_parent().add_child(piece_instance)
		piece_instance.get_node("sprite_pieces").texture = load(pieces[piece])
		piece_instance.global_position = global_position
		piece_instance.apply_impulse(Vector2(randi_range(impulse, -impulse), randi_range(-impulse, -impulse * 2)))
	queue_free()
		
func create_coin():
	var coin = coin_instance.instantiate()
	get_parent().call_deferred("add_child", coin)
	coin.global_position = spawn_coin.global_position
	coin.apply_impulse(Vector2(randi_range(-50, 50), -150))
