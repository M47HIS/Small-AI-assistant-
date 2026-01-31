import AppKit
import Foundation

final class AppSettings: ObservableObject {
    @Published var streamingEnabled: Bool {
        didSet { defaults.set(streamingEnabled, forKey: Keys.streamingEnabled) }
    }
    @Published var idleTimeoutSeconds: TimeInterval {
        didSet { defaults.set(idleTimeoutSeconds, forKey: Keys.idleTimeoutSeconds) }
    }
    @Published var defaultModelID: String {
        didSet { defaults.set(defaultModelID, forKey: Keys.defaultModelID) }
    }
    @Published var hotkey: KeyCombo {
        didSet {
            defaults.set(hotkey.keyCode, forKey: Keys.hotkeyCode)
            defaults.set(hotkey.modifiers.rawValue, forKey: Keys.hotkeyModifiers)
        }
    }

    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        let streamingValue = defaults.object(forKey: Keys.streamingEnabled) as? Bool
        self.streamingEnabled = streamingValue ?? true

        let timeoutValue = defaults.object(forKey: Keys.idleTimeoutSeconds) as? Double
        self.idleTimeoutSeconds = timeoutValue ?? 90

        self.defaultModelID = defaults.string(forKey: Keys.defaultModelID) ?? ModelInfo.phi15.id

        let storedKeyCode = defaults.object(forKey: Keys.hotkeyCode) as? Int
        let storedModifiersRaw = defaults.object(forKey: Keys.hotkeyModifiers) as? UInt
        if let storedKeyCode, let storedModifiersRaw {
            self.hotkey = KeyCombo(keyCode: storedKeyCode, modifiers: NSEvent.ModifierFlags(rawValue: storedModifiersRaw))
        } else {
            self.hotkey = KeyCombo(keyCode: 49, modifiers: [.option])
        }
    }
}

private enum Keys {
    static let streamingEnabled = "settings.streaming.enabled"
    static let idleTimeoutSeconds = "settings.idle.timeout"
    static let defaultModelID = "settings.model.default"
    static let hotkeyCode = "settings.hotkey.code"
    static let hotkeyModifiers = "settings.hotkey.modifiers"
}
