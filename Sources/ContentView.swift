import SwiftUI

struct ContentView: View {
    @State private var isOn1 = false
    @State private var isOn2 = true
    @State private var isOn3 = false

    var body: some View {
        Form {
            Section("基础 Toggle") {
                Toggle("接收通知", isOn: $isOn1)
                Toggle("深色模式", isOn: $isOn2)
                Toggle("自动保存", isOn: $isOn3)

                Text("当前状态: \(isOn1 ? "开" : "关"), \(isOn2 ? "开" : "关"), \(isOn3 ? "开" : "关")")
                    .foregroundColor(.secondary)
            }

            Section("自定义标签") {
                Toggle {
                    HStack {
                        Image(systemName: "bell.fill")
                        Text("消息通知")
                    }
                } isOn: $isOn1

                Toggle {
                    HStack {
                        Image(systemName: "moon.fill")
                        Text("夜间模式")
                    }
                } isOn: $isOn2
            }

            Section("开关样式") {
                Toggle("默认样式", isOn: $isOn1)

                Toggle("带颜色", isOn: $isOn2)
                    .toggleStyle(.switch)
            }

            Section("开关状态对应的UI变化") {
                Toggle("显示详细信息", isOn: $isOn1)

                if isOn1 {
                    VStack(alignment: .leading) {
                        Text("这是详细信息")
                            .foregroundColor(.blue)
                        Text("更多内容...")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                }
            }

            Section("分组开关") {
                Toggle("全选", isOn: .constant(true))
                    .disabled(true)

                ForEach(["选项 A", "选项 B", "选项 C"], id: \.self) { item in
                    HStack {
                        Text(item)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    }
                }
            }
        }
        .formStyle(.grouped)
        .padding()
    }
}
