import AppKit
import SwiftUI

struct PreferencesView: View {
    @ObservedObject var settings: AppSettings
    @State private var isRecording = false
    @State private var recordingHint = "Press Record to set a new shortcut."

    var body: some View {
        ZStack {
            Color(nsColor: .windowBackgroundColor)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {
                header
                hotkeyCard
                settingsCard
                modelCard
                Spacer()
            }
            .padding(22)
        }
        .frame(minWidth: 540, minHeight: 420)
        .onDisappear {
            stopRecording()
        }
    }

    private var header: some View {
        HStack(spacing: 10) {
            Image(systemName: "sparkle")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.accentColor)
            VStack(alignment: .leading, spacing: 2) {
                Text("Preferences")
                    .font(.custom("Avenir Next Demi Bold", size: 18))
                Text("Hotkeys, streaming, and default model")
                    .font(.custom("Avenir Next", size: 11))
                    .foregroundColor(.secondary)
            }
        }
    }

    private var hotkeyCard: some View {
        card {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Hotkey")
                        .font(.custom("Avenir Next Demi Bold", size: 14))
                    Spacer()
                    Text(settings.hotkey.displayString)
                        .font(.custom("Avenir Next", size: 11))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(Color(nsColor: .controlBackgroundColor)))
                }
                Text(recordingHint)
                    .font(.custom("Avenir Next", size: 11))
                    .foregroundColor(.secondary)
                HStack {
                    Button {
                        toggleRecording()
                    } label: {
                        Text(isRecording ? "Recording…" : "Record Shortcut")
                            .font(.custom("Avenir Next Demi Bold", size: 12))
                    }
                    .buttonStyle(.borderedProminent)

                    if isRecording {
                        Button("Cancel") {
                            stopRecording()
                        }
                        .buttonStyle(.bordered)
                    }
                    Spacer()
                }
                if isRecording {
                    KeyCaptureView(onKeyDown: handleRecorded)
                        .frame(width: 1, height: 1)
                        .opacity(0.01)
                }
            }
        }
    }

    private var settingsCard: some View {
        card {
            VStack(alignment: .leading, spacing: 12) {
                Text("Behavior")
                    .font(.custom("Avenir Next Demi Bold", size: 14))
                Toggle("Stream tokens", isOn: $settings.streamingEnabled)
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Idle unload")
                            .font(.custom("Avenir Next", size: 12))
                        Text("Unload model after inactivity")
                            .font(.custom("Avenir Next", size: 10))
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Stepper(value: $settings.idleTimeoutSeconds, in: 30...300, step: 10) {
                        Text("\(Int(settings.idleTimeoutSeconds))s")
                            .font(.custom("Avenir Next", size: 11))
                    }
                    .frame(width: 120)
                }
            }
        }
    }

    private var modelCard: some View {
        card {
            VStack(alignment: .leading, spacing: 12) {
                Text("Default model")
                    .font(.custom("Avenir Next Demi Bold", size: 14))
                Picker("Default model", selection: $settings.defaultModelID) {
                    ForEach(ModelInfo.available) { model in
                        Text(model.name).tag(model.id)
                    }
                }
                .pickerStyle(.menu)
                HStack {
                    Text("Models stored at")
                        .font(.custom("Avenir Next", size: 10))
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(ModelStorage.modelsDirectory.path)
                        .font(.custom("Avenir Next", size: 10))
                        .foregroundColor(.secondary)
                }
            }
        }
    }

    private func card<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        content()
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(nsColor: .controlBackgroundColor))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Color(nsColor: .separatorColor), lineWidth: 1)
                    )
            )
    }

    private func toggleRecording() {
        if isRecording {
            stopRecording()
        } else {
            startRecording()
        }
    }

    private func startRecording() {
        isRecording = true
        recordingHint = "Press the new shortcut now."
    }

    private func stopRecording(resetHint: Bool = true) {
        isRecording = false
        if resetHint {
            recordingHint = "Press Record to set a new shortcut."
        }
    }

    private func handleRecorded(_ event: NSEvent) {
        guard isRecording else { return }
        guard isModifierKeyCode(Int(event.keyCode)) == false else { return }
        let modifiers = event.modifierFlags.intersection([.command, .option, .control, .shift])
        if event.keyCode == 53 {
            stopRecording()
            recordingHint = "Recording cancelled."
            return
        }
        DispatchQueue.main.async {
            let combo = KeyCombo(keyCode: Int(event.keyCode), modifiers: modifiers)
            settings.hotkey = combo
            recordingHint = "Recorded: \(combo.displayString)"
            stopRecording(resetHint: false)
        }
    }

    private func isModifierKeyCode(_ keyCode: Int) -> Bool {
        switch keyCode {
        case 54, 55, 56, 57, 58, 59, 60, 61, 62:
            return true
        default:
            return false
        }
    }
}

private struct KeyCaptureView: NSViewRepresentable {
    let onKeyDown: (NSEvent) -> Void

    func makeNSView(context: Context) -> KeyCaptureNSView {
        KeyCaptureNSView(onKeyDown: onKeyDown)
    }

    func updateNSView(_ nsView: KeyCaptureNSView, context: Context) {
        DispatchQueue.main.async {
            nsView.window?.makeFirstResponder(nsView)
        }
    }
}

private final class KeyCaptureNSView: NSView {
    private let onKeyDown: (NSEvent) -> Void

    init(onKeyDown: @escaping (NSEvent) -> Void) {
        self.onKeyDown = onKeyDown
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override var acceptsFirstResponder: Bool {
        true
    }

    override func keyDown(with event: NSEvent) {
        onKeyDown(event)
    }
}
