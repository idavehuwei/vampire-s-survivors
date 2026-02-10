# Vampire's Survivors

一个基于 Godot 4 引擎开发的吸血鬼生存类游戏。

## 项目概述

这是一个 2D 动作生存游戏项目，灵感来源于经典的 Vampire Survivors 游戏。玩家将扮演吸血鬼角色，在不断涌来的敌人波次中生存下去，通过击败敌人获得经验值和升级道具。

## 技术栈

- **游戏引擎**: Godot 4.3
- **编程语言**: GDScript
- **平台**: 跨平台 (Windows, macOS, Linux)

## 项目结构

```
vampire's-survivors/
├── scenes/           # 场景文件
│   └── player/       # 玩家相关资源
│       ├── player.tscn    # 玩家场景文件
│       ├── player.png     # 玩家精灵图片
│       └── player.png.import # 导入配置文件
├── .godot/          # Godot 编辑器生成的文件
├── .gitignore       # Git 忽略文件配置
├── project.godot    # 项目配置文件
└── README.md        # 项目说明文件
```

## 当前进度

### 已完成
- ✅ 项目初始化和 Git 配置
- ✅ 玩家角色基础场景创建
- ✅ 基础游戏框架搭建

### 开发计划
1. 实现玩家移动控制
2. 添加敌人生成系统
3. 设计武器和攻击系统
4. 实现经验值和升级机制
5. 添加音效和背景音乐
6. 优化游戏平衡性

## 快速开始

### 运行项目
1. 下载并安装 [Godot 4.3](https://godotengine.org/download)
2. 克隆本仓库：
   ```bash
   git clone https://github.com/idavehuwei/vampire-s-survivors.git
   ```
3. 打开 Godot 编辑器
4. 导入项目（选择 `project.godot` 文件）
5. 运行项目

### 开发环境
- 推荐使用 Godot 编辑器进行开发
- 代码遵循 Godot 4 的最佳实践
- 使用 GDScript 编写游戏逻辑

## 贡献指南

欢迎提交 Issue 和 Pull Request 来帮助改进项目！

## 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 联系方式

如有问题或建议，请通过以下方式联系：
- GitHub Issues: [项目 Issues 页面](https://github.com/idavehuwei/vampire-s-survivors/issues)