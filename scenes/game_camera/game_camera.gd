# 跟随型主相机：将画面中心锁定到玩家位置
# 通过节点分组 "player" 查找玩家；当前实现为插值平滑跟随（尚无死区/边界）
extends Camera2D

var target_position = Vector2.ZERO
# 目标位置：每帧获取玩家位置后用于插值跟随

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 设为当前相机；若场景中存在多个 Camera2D，以最后一次 make_current 为准
	make_current()


func _process(delta: float) -> void:
	acquire_target()
	# 插值平滑跟随
	global_position = global_position.lerp(target_position, .5)
	# 0.5 为插值因子，数值越大越“跟得紧”，越小越平滑
	

func acquire_target():
	# 每帧查询玩家分组；若能找到玩家，则将相机位置与其全局坐标对齐
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		# 记录玩家位置为目标点；后续可按需加入死区与边界限制
		var player = player_nodes[0] as Node2D
		target_position = player.global_position
	
