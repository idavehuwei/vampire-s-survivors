extends Node
class_name HealthComponent
#
# 生命值组件：
# - 为任意节点提供基础的生命/受伤/死亡逻辑
# - 当生命归零时发出 died 信号，并销毁 owner
#
signal died
#
# 初始最大生命值，可在检查器配置
@export var max_health: float = 10
# 当前生命值；在 _ready 中初始化为 max_health
var current_health
#
func _ready():
	# 初始化当前生命值
	current_health = max_health
#
func damage(damage_amount: float):
	# 扣减伤害并限制不低于 0
	current_health = max( current_health - damage_amount, 0)
	# 延迟检查死亡，避免在本帧的物理/信号链中立即 queue_free
	Callable(check_death).call_deferred()
	
func check_death():
	# 生命归零：发出死亡信号并销毁宿主
	if current_health == 0:
		died.emit()
		owner.queue_free()
		
	
	
	
