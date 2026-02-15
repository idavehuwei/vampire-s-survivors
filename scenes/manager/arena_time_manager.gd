# 竞技场计时管理器：提供生存倒计时的时间查询
# 责任：
# - 持有子节点 Timer，读取 wait_time 与 time_left
# - 对外提供 get_time_elapsed() 返回已流逝时间（秒）
# 用法：
# - 在主场景中实例化本节点并启用 Timer（autostart/one_shot）
# - 由 UI（ArenaTimeUI）调用 get_time_elapsed() 显示时间
extends Node

@onready var timer = $Timer
# 子计时器：用于计算“已流逝时间”与剩余时间

func get_time_elapsed():
	# 已流逝时间 = 总时长(wait_time) − 当前剩余时间(time_left)
	return timer.wait_time - timer.time_left
 
