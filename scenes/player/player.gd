extends CharacterBody2D

# 统一的移动速度标量，单位为像素/秒
const MAX_SPEED = 200

# 节点进入场景时调用。当前是 pass，占位，未做初始化
func _ready() -> void:
	#add_to_group("player")
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement_vector = get_movement_vector()
	# 固定速度与斜向一致：使用 normalized 保证斜向移动不会比直线更快（保持统一 MAX_SPEED）。
	var direction = movement_vector.normalized()
	velocity = direction * MAX_SPEED
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
	
