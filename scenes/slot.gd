extends PanelContainer


@export var item : Weapon:
	set(value):
		item = value
		$TextureRect.texture = value.texture
		$Cooldown.wait_time = value.cooldown


func _on_cooldown_timeout() -> void:
	if item :
		$Cooldown.wait_time = item.cooldown
		item.activate(owner,owner.nearest_enemy,get_tree())
