import Foundation

@MainActor
final class ModelManager: ObservableObject {
    @Published private(set) var activeModelID: String?
    @Published private(set) var isLoading = false

    private let settings: AppSettings
    private var idleTimer: Timer?

    init(settings: AppSettings) {
        self.settings = settings
        self.activeModelID = nil
    }

    var missingModels: [ModelInfo] {
        ModelInfo.available.filter { !FileManager.default.fileExists(atPath: $0.localURL.path) }
    }

    func selectModel(id: String) {
        if activeModelID != id {
            unloadActiveModel()
        }
        settings.defaultModelID = id
    }

    func streamResponse(prompt: String, context: ContextSnapshot) -> AsyncStream<String> {
        AsyncStream { continuation in
            Task { @MainActor in
                do {
                    try await loadModelIfNeeded()
                } catch {
                    continuation.yield("Model unavailable. Please download it in first-run setup.")
                    continuation.finish()
                    return
                }

                let resolvedModelID = activeModelID ?? settings.defaultModelID
                let modelName = ModelInfo.available.first(where: { $0.id == resolvedModelID })?.name ?? "Unknown"
                let response = "(Stub) [\(modelName)] Answer placeholder."
                if settings.streamingEnabled {
                    let tokens = response.split(separator: " ").map(String.init)
                    for token in tokens {
                        continuation.yield(token + " ")
                        try? await Task.sleep(nanoseconds: 120_000_000)
                    }
                } else {
                    continuation.yield(response)
                }
                continuation.finish()
                scheduleIdleUnload()
            }
        }
    }

    private func loadModelIfNeeded() async throws {
        let modelID = settings.defaultModelID
        guard activeModelID != modelID else { return }
        guard let model = ModelInfo.available.first(where: { $0.id == modelID }) else {
            throw ModelManagerError.unknownModel
        }
        guard FileManager.default.fileExists(atPath: model.localURL.path) else {
            throw ModelManagerError.modelMissing
        }
        isLoading = true
        try await Task.sleep(nanoseconds: 200_000_000)
        activeModelID = modelID
        isLoading = false
    }

    private func scheduleIdleUnload() {
        idleTimer?.invalidate()
        idleTimer = Timer.scheduledTimer(withTimeInterval: settings.idleTimeoutSeconds, repeats: false) { [weak self] _ in
            Task { @MainActor in
                self?.unloadActiveModel()
            }
        }
    }

    func unloadActiveModel() {
        idleTimer?.invalidate()
        idleTimer = nil
        activeModelID = nil
    }
}

enum ModelManagerError: Error {
    case modelMissing
    case unknownModel
}
