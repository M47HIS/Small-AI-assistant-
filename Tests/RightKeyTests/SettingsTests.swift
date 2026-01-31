import XCTest
@testable import RightKey

final class SettingsTests: XCTestCase {
    func testDefaultSettings() {
        let defaults = UserDefaults(suiteName: "RightKeyTests")!
        defaults.removePersistentDomain(forName: "RightKeyTests")
        let settings = AppSettings(defaults: defaults)
        XCTAssertEqual(settings.streamingEnabled, true)
        XCTAssertEqual(settings.idleTimeoutSeconds, 90)
        XCTAssertEqual(settings.defaultModelID, ModelInfo.phi15.id)
    }
}
