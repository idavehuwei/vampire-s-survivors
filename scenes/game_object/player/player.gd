# 玩家控制：基于输入映射计算移动方向并执行滑动式移动
# 通过场景分组加入 "player"，供相机与能力系统检索
extends CharacterBody2D

# 统一的移动速度标量，单位为像素/秒
const MAX_SPEED = 200
const ACCELERATION_SMOOTHING = 25
 
# 节点进入场景时调用。当前是 pass，占位，未做初始化
func _ready() -> void:
	# 分组在 player.tscn 中设置为 ["player"]；此处无需重复添加
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement_vector = get_movement_vector()
	# 固定速度与斜向一致：使用 normalized 保证斜向移动不会比直线更快（保持统一 MAX_SPEED）。
	var direction = movement_vector.normalized()
	var target_velocity = direction * MAX_SPEED
	velocity = velocity.lerp(target_velocity, 1- exp(-delta * ACCELERATION_SMOOTHING))
	# 使用当前 velocity 执行滑动式移动并处理与碰撞体的相互作用
	move_and_slide()

# 每帧获取输入方向
func get_movement_vector():
	var movement_vector = Vector2.ZERO
	# - x 轴：右(1或0) − 左(1或0)，得到 −1、0、1。
	# - y 轴：下(1或0) − 上(1或0)，注意 Godot 的 y 轴向下为正，上为负。
	var x_movement = Input.get_action_strength("move_right") -  Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") -  Input.get_action_strength("move_up")
	
	return Vector2(x_movement,y_movement)
	
