# 近战剑技能生成控制器：按计时器节奏在玩家位置实例化技能节点
# 通过导出 PackedScene 在检查器中配置具体技能场景
extends Node

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
	print("do something") 
	# 计时器回调：在玩家当前位置生成一把“剑技能”实例
 
	var player  = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
		# 若玩家未找到则直接返回，避免空引用错误
		
	var sword_instance = sword_ability.instantiate() as Node2D	
	player.get_parent().add_child(sword_instance)
	# 将技能添加到玩家的父节点：确保与玩家处于同一层级，便于坐标/渲染管理
	sword_instance.global_position = player.global_position
	# 将技能的全局坐标对齐到玩家位置，实现“围绕玩家释放”的效果
	
	# 可选扩展：根据玩家朝向设置旋转/动画；根据升级系统调整伤害/范围/持续时间
	
	
