import Foundation

enum ModelBackend: String {
    case llamaCpp
    case rwkv
}

struct ModelInfo: Identifiable, Hashable {
    let id: String
    let name: String
    let backend: ModelBackend
    let downloadURL: URL
    let fileName: String

    var localURL: URL {
        ModelStorage.modelsDirectory.appendingPathComponent(fileName)
    }

    static let phi15 = ModelInfo(
        id: "phi-1.5-q4",
        name: "Phi-1.5 Q4",
        backend: .llamaCpp,
        downloadURL: URL(string: "https://huggingface.co/TheBloke/phi-1_5-GGUF/resolve/main/phi-1_5.Q4_K_M.gguf")!,
        fileName: "phi-1_5.Q4_K_M.gguf"
    )

    static let rwkv430 = ModelInfo(
        id: "rwkv-430m",
        name: "RWKV 430M",
        backend: .rwkv,
        downloadURL: URL(string: "https://huggingface.co/RWKV/rwkv-4-pile-430m/resolve/main/RWKV-4-Pile-430M-20220808-8066.pth")!,
        fileName: "RWKV-4-Pile-430M-20220808-8066.pth"
    )

    static let available: [ModelInfo] = [phi15, rwkv430]
}

enum ModelStorage {
    static let modelsDirectory = URL(fileURLWithPath: "/Users/mathis.naud/Desktop/DEV/MODELS", isDirectory: true)
}
