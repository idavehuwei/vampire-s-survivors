# Vampire's Survivors 版本变更与文件说明

本文件用于记录每次版本变更、涉及文件以及新增/调整的功能点，帮助快速理解项目演进与各文件职责。

## 版本历史
### 2.5（2026-02-12）
- 完成“打败敌人”功能：剑技能命中后消灭目标
  - 敌人：通过 Area2D 监听 area_entered，命中后 queue_free
    - [basic_enemy.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/basic_enemy/basic_enemy.gd)
    - [basic_enemy.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/basic_enemy/basic_enemy.tscn)
  - 技能：动画中控制 CollisionShape2D 的启用窗口，结束时自动销毁；设置碰撞层为 4
    - [sword_ability.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/ability/sword_ability/sword_ability.tscn)
  - 控制器：生成位置加入轻微随机偏移，并旋转朝向目标，提高命中稳定性
    - [sword_ability_controller.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/ability/sword_ability_controller/sword_ability_controller.gd)
### 2.4（2026-02-12）
- 用 sword 攻击怪物：基于距离选择目标并在其位置释放剑技能
  - 在控制器中新增范围选择与距离排序，优先攻击最近敌人（MAX_RANGE=150）
    - [sword_ability_controller.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/ability/sword_ability_controller/sword_ability_controller.gd)
  - 为基础敌人场景加入分组 ["enemy"]，便于技能检索目标
    - [basic_enemy.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/basic_enemy/basic_enemy.tscn)
  - 主场景新增一名敌人实例并调整初始位置，便于验证攻击逻辑
    - [main.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/main/main.tscn)
  - 项目配置新增 global_group: enemy，规范化分组
    - [project.godot](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/project.godot)
### 2.3（2026-02-12）
- 扩展完善 sword 能力——实现多剑环绕攻击模式
  - 扩展 sword_ability_controller.gd，实现多把剑围绕玩家的环形分布
  - 优化剑技能的生成算法，支持动态角度分布
  - 为剑技能添加伤害区域检测，增强战斗体验
  - 为剑技能添加伤害区域检测，增强战斗体验
  - 改进剑技能的生命周期管理，提升性能表现
  - 更新相关注释和代码文档，便于后续维护

### 2.2（见提交记录）
- 初步实现剑技能与控制器
  - 计时器驱动在玩家位置生成单把剑技能，可通过导出变量配置场景
  - 影响文件：
    - [sword_ability_controller.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/ability/sword_ability_controller/sword_ability_controller.gd)
    - [sword_ability.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/ability/sword_ability/sword_ability.tscn)

### 2.1（2026-02-12）
- 相机改为插值平滑跟随玩家（相机位置与目标位置做 lerp），视觉更自然。
  - 影响文件：[game_camera.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/game_camera/game_camera.gd)
- 增强注释，明确相机与技能控制器的职责与扩展点。
  - 影响文件：
    - [game_camera.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/game_camera/game_camera.gd)
    - [sword_ability_controller.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/ability/sword_ability_controller/sword_ability_controller.gd)
- 现有逻辑不变：主场景结构、玩家移动、基础敌人追踪保持。

### 1.6（初始里程碑）
- 引入主场景，包含玩家、相机与 TileMap。
  - [main.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/main/main.tscn)
- 玩家基础移动：基于输入映射（WASD/方向键），归一化确保斜向速度一致。
  - [player.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/player/player.gd)
  - [player.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/player/player.tscn)
- 相机硬跟随玩家（每帧对齐玩家全局坐标）。
  - [game_camera.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/game_camera/game_camera.gd)
  - [game_camera.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/game_camera/game_camera.tscn)
- 初始技能系统：计时器周期在玩家位置实例化“剑技能”。
  - [sword_ability_controller.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/ability/sword_ability_controller/sword_ability_controller.gd)
  - [sword_ability.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/ability/sword_ability/sword_ability.tscn)
- 基础敌人：持续朝向玩家追踪移动。
  - [basic_enemy.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/basic_enemy/basic_enemy.gd)
  - [basic_enemy.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/basic_enemy/basic_enemy.tscn)

## 文件功能索引
- 主场景：[main.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/main/main.tscn)
  - 组装入口；实例化玩家、相机与 TileMapLayer。
- 相机脚本与场景：
  - [game_camera.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/game_camera/game_camera.tscn)：Camera2D 节点与脚本绑定。
  - [game_camera.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/game_camera/game_camera.gd)：跟随玩家（2.1 起为插值平滑）。
- 玩家：
  - [player.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/player/player.tscn)：CharacterBody2D、精灵与碰撞；groups=["player"]。
  - [player.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/player/player.gd)：读取输入、归一化速度、move_and_slide。
- 技能系统：
  - [sword_ability_controller.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/ability/sword_ability_controller/sword_ability_controller.gd)：计时器回调在玩家处生成技能。
  - [sword_ability.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/ability/sword_ability/sword_ability.tscn)：“剑技能”场景（Node2D+Sprite2D）。
- 敌人：
  - [basic_enemy.gd](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/basic_enemy/basic_enemy.gd)：朝玩家方向移动；速度 75。
  - [basic_enemy.tscn](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/scenes/basic_enemy/basic_enemy.tscn)：基础敌人场景。
- 资源配置：
  - [project.godot](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/project.godot)：项目配置（窗口、输入映射、主场景）。
  - [tileset.tres](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/resources/tileset.tres)：TileSet 定义。
  - [tilemap_packed.png](file:///Users/weihu/Documents/MyWorkSpace2026/MyDungeon/vampire's-survivors/assets/environment/tilemap_packed.png)：TileMap 美术贴图。

## 更新与维护规范
- 每次提交后，在“版本历史”中追加一个条目：
  - 标题格式：版本号（日期）
  - 内容包含：变更摘要、涉及文件链接、关键影响点。
- 推荐提交信息前缀：feat / fix / refactor / docs / chore 等，便于检索。
- 若涉及公共接口或玩法改动，请在对应脚本文件顶部补充简短注释，保持文档与代码同步。
