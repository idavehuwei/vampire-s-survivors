# 生存时间 UI：以 mm:ss 显示玩家已存活时间
# 责任：
# - 从 ArenaTimeManager 拉取时间并更新 Label
# 用法：
# - 在主场景将 arena_time_manager 指向 ArenaTimeManager 节点
extends CanvasLayer

@export var arena_time_manager: Node 
# 导出的场景引用：指向 ArenaTimeManager
@onready var label = $MarginContainer/Label
# 文本控件：显示格式化后的时间

func _process(delta):
	# 每帧刷新文本；若未绑定管理器则直接返回
	if arena_time_manager == null:
		return
	var time_elapsed = arena_time_manager.get_time_elapsed()
	# 格式化为 mm:ss 并显示
	label.text = format_seconds_to_string(time_elapsed)

func format_seconds_to_string(seconds: float):
	# 将秒数格式化为 "mm:ss"；向下取整到秒
	var minutes = floor(seconds / 60)
	var remaining_seconds = seconds - (minutes * 60)
	return str(minutes) + ":" + "%02d" % floor(remaining_seconds)
