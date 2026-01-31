import Foundation

final class DownloadManager {
    func downloadMissing(models: [ModelInfo]) async throws {
        if models.isEmpty { return }
        try FileManager.default.createDirectory(at: ModelStorage.modelsDirectory, withIntermediateDirectories: true)

        for model in models {
            if FileManager.default.fileExists(atPath: model.localURL.path) { continue }
            let (tempURL, _) = try await URLSession.shared.download(from: model.downloadURL)
            if FileManager.default.fileExists(atPath: model.localURL.path) {
                try FileManager.default.removeItem(at: model.localURL)
            }
            try FileManager.default.moveItem(at: tempURL, to: model.localURL)
        }
    }
}
