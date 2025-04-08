import Foundation
import Carbon

// 切换到指定索引的输入法，如果未指定索引则切换到下一个
func switchInputMethod(targetIndex: Int? = nil) {
    print("开始切换输入法...")
    
    // 获取所有输入源
    let inputSourceNSArray = TISCreateInputSourceList(nil, false).takeRetainedValue() as NSArray
    let inputSources = inputSourceNSArray as! [TISInputSource]
    let currentSource = TISCopyCurrentKeyboardInputSource().takeRetainedValue()
    
    // 获取当前输入源ID
    guard let currentID = TISGetInputSourceProperty(currentSource, kTISPropertyInputSourceID) else {
        print("错误：无法获取当前输入源ID")
        return
    }
    let currentInputSourceID = Unmanaged<CFString>.fromOpaque(currentID).takeUnretainedValue() as String
    
    if let currentName = TISGetInputSourceProperty(currentSource, kTISPropertyLocalizedName) {
        let currentNameString = Unmanaged<CFString>.fromOpaque(currentName).takeUnretainedValue() as String
        print("当前输入法: \(currentNameString) (ID: \(currentInputSourceID))")
    }
    
    // 筛选键盘输入源
    let keyboardSources = inputSources.filter { source in
        guard let category = TISGetInputSourceProperty(source, kTISPropertyInputSourceCategory) else {
            return false
        }
        let categoryString = Unmanaged<CFString>.fromOpaque(category).takeUnretainedValue() as String
        
        // 只保留键盘输入源，并且确保它是可选择的
        let isSelectable = TISGetInputSourceProperty(source, kTISPropertyInputSourceIsSelectCapable)
        let selectCapable = isSelectable != nil && CFBooleanGetValue(Unmanaged<CFBoolean>.fromOpaque(isSelectable!).takeUnretainedValue())
        
        return categoryString == (kTISCategoryKeyboardInputSource as String) && selectCapable
    }
    
    print("找到 \(keyboardSources.count) 个键盘输入源:")
    
    // 打印所有可用的键盘输入源
    for (i, source) in keyboardSources.enumerated() {
        if let name = TISGetInputSourceProperty(source, kTISPropertyLocalizedName),
           let id = TISGetInputSourceProperty(source, kTISPropertyInputSourceID) {
            let nameString = Unmanaged<CFString>.fromOpaque(name).takeUnretainedValue() as String
            let idString = Unmanaged<CFString>.fromOpaque(id).takeUnretainedValue() as String
            print("[\(i)] \(nameString) (ID: \(idString))")
        }
    }
    
    // 如果找不到有效的键盘输入源，则退出
    if keyboardSources.isEmpty {
        print("错误：没有找到可用的键盘输入源")
        return
    }
    
    // 如果指定了目标索引，直接切换到该索引的输入法
    if let index = targetIndex {
        if index >= 0 && index < keyboardSources.count {
            // 获取目标输入法的名称
            if let targetName = TISGetInputSourceProperty(keyboardSources[index], kTISPropertyLocalizedName) {
                let targetNameString = Unmanaged<CFString>.fromOpaque(targetName).takeUnretainedValue() as String
                print("直接切换到索引 \(index) 的输入法: \(targetNameString)")
            }
            
            // 选择目标输入源
            let status = TISSelectInputSource(keyboardSources[index])
            print("切换状态: \(status == noErr ? "成功" : "失败 (错误码: \(status))")")
            return
        } else {
            print("错误：索引 \(index) 超出范围 (0-\(keyboardSources.count-1))")
            return
        }
    }
    
    // 未指定目标索引时，找到当前输入源在列表中的位置，切换到下一个
    if let index = keyboardSources.firstIndex(where: { source in
        guard let id = TISGetInputSourceProperty(source, kTISPropertyInputSourceID) else {
            return false
        }
        let sourceID = Unmanaged<CFString>.fromOpaque(id).takeUnretainedValue() as String
        return sourceID == currentInputSourceID
    }) {
        // 计算下一个输入源的索引（循环切换）
        let nextIndex = (index + 1) % keyboardSources.count
        print("当前输入法索引: \(index), 下一个输入法索引: \(nextIndex)")
        
        // 获取下一个输入法的名称
        if let nextName = TISGetInputSourceProperty(keyboardSources[nextIndex], kTISPropertyLocalizedName) {
            let nextNameString = Unmanaged<CFString>.fromOpaque(nextName).takeUnretainedValue() as String
            print("切换到输入法: \(nextNameString)")
        }
        
        // 选择下一个输入源
        let status = TISSelectInputSource(keyboardSources[nextIndex])
        print("切换状态: \(status == noErr ? "成功" : "失败 (错误码: \(status))")")
    } else {
        print("当前输入法不在可用列表中，切换到第一个输入法")
        // 如果当前输入源不在列表中，选择列表中的第一个
        let status = TISSelectInputSource(keyboardSources[0])
        print("切换状态: \(status == noErr ? "成功" : "失败 (错误码: \(status))")")
    }
}

// 主程序：处理命令行参数
func main() {
    let arguments = CommandLine.arguments
    
    if arguments.count > 1 {
        // 第一个参数是程序名，第二个参数是索引
        if let index = Int(arguments[1]) {
            switchInputMethod(targetIndex: index)
        } else if arguments[1] == "--list" || arguments[1] == "-l" {
            // 只打印列表，不切换
            switchInputMethod(targetIndex: nil)
            print("使用 \(arguments[0]) [索引] 可直接切换到指定输入法")
        } else {
            print("用法: \(arguments[0]) [索引|--list]")
            print("  不带参数: 切换到下一个输入法")
            print("  [索引]:   直接切换到指定索引的输入法")
            print("  --list:   列出所有可用输入法及其索引")
        }
    } else {
        // 无参数情况下，切换到下一个输入法
        switchInputMethod()
    }
}

main()
