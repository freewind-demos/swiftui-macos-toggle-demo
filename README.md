# SwiftUI macOS Toggle 开关

## 简介

演示 SwiftUI 中 Toggle 开关控件的用法。

## 快速开始

```bash
cd swiftui-macos-toggle-demo
xcodegen generate
open SwiftUIToggleDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### 基础 Toggle

```swift
@State private var isOn = false

Toggle("接收通知", isOn: $isOn)
```

### 自定义标签视图

使用 ViewBuilder 创建自定义标签：

```swift
Toggle {
    HStack {
        Image(systemName: "bell.fill")
        Text("消息通知")
    }
} isOn: $isOn
```

### 根据状态显示/隐藏内容

```swift
Toggle("显示详细信息", isOn: $showDetails)

if showDetails {
    VStack {
        Text("详细信息内容")
    }
}
```

### Toggle 样式

macOS 提供不同的 toggle 样式，通过 `.toggleStyle()` 修改：

```swift
Toggle("开关", isOn: $isOn)
    .toggleStyle(.switch)
```

## 完整示例

```swift
struct ContentView: View {
    @State private var isEnabled = false

    var body: some View {
        Form {
            Toggle("启用功能", isOn: $isEnabled)

            if isEnabled {
                Text("功能已启用，显示更多选项...")
            }
        }
    }
}
```

## 完整讲解（中文）

### Toggle 工作原理

Toggle 是一个二进制开关，只有开/关两种状态。它绑定到一个 Bool 类型的 @State 变量。

### 使用场景

- 设置页面中的开关选项
- 表单中的布尔值输入
- 根据用户选择显示/隐藏内容

### Toggle 与 if

Toggle 经常和 `if` 语句配合，根据开关状态显示不同内容：

```swift
Toggle("显示高级选项", isOn: $showAdvanced)

if showAdvanced {
    // 显示高级选项
}
```
