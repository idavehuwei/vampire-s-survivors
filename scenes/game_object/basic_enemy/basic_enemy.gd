# 基础敌人：持续朝玩家移动的追踪单位
extends CharacterBody2D

const MAX_SPEED = 75
# 最大移动速度（像素/秒）

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 监听技能的 Area2D 进入事件：被命中时执行销毁
	$Area2D.area_entered.connect(on_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# 计算指向玩家的单位方向，并按最大速度移动
	var direction = get_direction_to_player()
	velocity = direction * MAX_SPEED
	move_and_slide()
	# 使用物理引擎的滑动移动，处理碰撞响应

func get_direction_to_player():
	# 返回指向玩家的单位向量；若无玩家则返回零向量
	var player_nodes = get_tree().get_first_node_in_group("player") as Node2D
	if player_nodes != null:
		return (player_nodes.global_position - global_position).normalized()
	return Vector2.ZERO	
	
func on_area_entered(other_area: Area2D): 
	# 命中判定：敌人被技能击中后自我销毁
	queue_free()
