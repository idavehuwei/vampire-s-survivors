extends Node
#
# 掉落组件：
# - 监听 HealthComponent 的 died 信号
# - 按概率在宿主位置生成经验药水（experience vial）
#
# 掉落概率（0~1），默认 50%
@export_range(0,1) var drop_percent: float = .5
# 经验药水的场景资源（PackedScene）
@export var vial_scene: PackedScene
# 引用宿主的生命组件（用于连接 died 信号）
@export var health_component: Node
#
func _ready():
	# 组件装载后，连接死亡信号到掉落回调
	(health_component as HealthComponent).died.connect(on_died)
	
	
	
func on_died():
	# 按概率决定是否掉落
	if randf() > drop_percent:
		return
	# 无配置的场景资源则跳过
	if vial_scene == null:
		return
	# 宿主必须是可定位到世界坐标的 Node2D
	if not owner is Node2D:
		return
	
	# 在宿主的全局位置生成并添加到同一父节点
	var spawn_position = (owner as Node2D).global_position
	var vial_instance = vial_scene.instantiate() as Node2D
	owner.get_parent().add_child(vial_instance)
	vial_instance.global_position = spawn_position
		
		
