# 敌人管理器：按计时器周期在玩家周围生成基础敌人
#
# 责任：
# - 连接子节点 Timer 的 timeout 信号，驱动周期性刷怪
# - 基于玩家 global_position 与随机方向、固定半径计算生成点
# - 实例化并添加 basic_enemy_scene 到父节点，使其与玩家处于同层级
#
# 用法：
# - 在 main.tscn 中作为独立节点实例化
# - 在检查器为 basic_enemy_scene 指定敌人场景（如 BasicEnemy.tscn）
extends Node

const SPAWN_RADIUS = 350
# 生成半径（像素）：以玩家为圆心的刷怪圈
@export var basic_enemy_scene: PackedScene
# 在检查器中指定要生成的敌人场景

 
func _ready() -> void:
	# 连接计时器超时信号：每次触发按规则生成一名敌人
	$Timer.timeout.connect(on_timer_timeout)

 
func on_timer_timeout():
	# 计时器回调：在玩家周围随机方向生成敌人
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player ==null:
		# 无玩家时不进行生成
		return
	 	
	# 在 0..TAU 范围内随机旋转单位向量，得到生成方向
	var random_direction = Vector2.RIGHT.rotated(randf_range(0,TAU))
	# 生成点 = 玩家位置 + 随机方向 * 固定半径
	var spawn_postion = player.global_position + (random_direction * SPAWN_RADIUS)
	
	# 实例化敌人并添加到父节点（通常与玩家同层级）
	var enemy = basic_enemy_scene.instantiate() as Node2D
	get_parent().add_child(enemy)
	# 设置敌人的全局位置为生成点
	enemy.global_position = spawn_postion
	
	
