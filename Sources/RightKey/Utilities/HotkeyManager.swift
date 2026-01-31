import Cocoa

struct KeyCombo: Equatable {
    let keyCode: Int
    let modifiers: NSEvent.ModifierFlags

    var displayString: String {
        let parts = [
            modifiers.contains(.command) ? "Cmd" : nil,
            modifiers.contains(.option) ? "Option" : nil,
            modifiers.contains(.control) ? "Ctrl" : nil,
            modifiers.contains(.shift) ? "Shift" : nil,
            keyLabel
        ].compactMap { $0 }
        return parts.joined(separator: "+")
    }

    private var keyLabel: String {
        switch keyCode {
        case 49: return "Space"
        case 36: return "Return"
        default: return "Key\(keyCode)"
        }
    }
}

final class HotkeyManager {
    var onHotkeyPressed: (() -> Void)?

    private let settings: AppSettings
    private var globalMonitor: Any?
    private var localMonitor: Any?

    init(settings: AppSettings) {
        self.settings = settings
    }

    func startListening() {
        stopListening()
        globalMonitor = NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { [weak self] event in
            self?.handle(event: event)
        }
        localMonitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown) { [weak self] event in
            self?.handle(event: event)
            return event
        }
    }

    func stopListening() {
        if let globalMonitor {
            NSEvent.removeMonitor(globalMonitor)
            self.globalMonitor = nil
        }
        if let localMonitor {
            NSEvent.removeMonitor(localMonitor)
            self.localMonitor = nil
        }
    }

    private func handle(event: NSEvent) {
        let combo = KeyCombo(keyCode: Int(event.keyCode), modifiers: event.modifierFlags.intersection([.command, .option, .control, .shift]))
        guard combo == settings.hotkey else { return }
        onHotkeyPressed?()
    }
}
