# 近战剑技能生成控制器：按计时器节奏在玩家位置实例化技能节点
# 通过导出 PackedScene 在检查器中配置具体技能场景
extends Node

const MAX_RANGE = 150
# 触发范围（像素）：仅在该半径内选择敌人

@export var sword_ability: PackedScene
# 在检查器中指定“剑技能”场景；通过 instantiate() 动态生成

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.timeout.connect(on_timer_timeout)
 
	# 连接子节点 Timer 的超时信号，用于周期性触发技能生成
 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	# 当前无逐帧更新逻辑；技能触发由计时器驱动


func on_timer_timeout(): 
	# 计时器回调：选择最近敌人并在其位置生成技能
	var player  = get_tree().get_first_node_in_group("player") as Node2D
	
	if player == null:
		return
		
	var enemies = get_tree().get_nodes_in_group("enemy")
	# 获取所有敌人节点
	enemies = enemies.filter(func(enemy:Node2D): 
		return enemy.global_position.distance_squared_to(player.global_position) < pow(MAX_RANGE,2)
	)
	# 过滤出在 MAX_RANGE 半径内的敌人
		 
	if enemies.size() == 0 :
		return
	
	enemies.sort_custom(func(a: Node2D, b: Node2D):
		var a_distince = a.global_position.distance_squared_to(player.global_position)
		var b_distince = b.global_position.distance_squared_to(player.global_position)
		return a_distince < b_distince	
	)
	# 按距离从小到大排序，索引 0 为最近目标
		
	var sword_instance = sword_ability.instantiate() as Node2D	
	player.get_parent().add_child(sword_instance)
	# 将技能添加到玩家的父节点：确保与玩家处于同一层级，便于坐标/渲染管理
	# 在最近敌人的位置处生成技能实例
	sword_instance.global_position = enemies[0].global_position
	# 轻微随机偏移，避免完全重叠并提升动画观感
	sword_instance.global_position += Vector2.RIGHT.rotated(randf_range(0,TAU)) * 4
 
	# 朝向目标旋转，使剑面指向敌人
	var enemy_direction = enemies[0].global_position - sword_instance.global_position
	sword_instance.rotation = enemy_direction.angle()
	
