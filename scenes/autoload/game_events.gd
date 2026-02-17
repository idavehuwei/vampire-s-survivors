extends Node
#
# 全局事件总线（autoload）：
# - 提供统一的游戏内事件转发与订阅入口
# - 当前包含：经验药水被收集（experience_vial_collected）
#
signal experience_vial_collected(number: float)
#
func emit_experience_vial_collected(number: float):
	# 触发经验拾取事件，参数为拾取数量
	experience_vial_collected.emit(number)
 
