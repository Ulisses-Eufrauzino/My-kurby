extends RigidBody2D



func _on_coin_tree_exited() -> void:
	queue_free() #Remove o item de colisão
