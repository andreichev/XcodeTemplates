// ___FILEHEADER___

import Foundation

final class ___VARIABLE_sceneName___Service: ___VARIABLE_sceneName___ServiceProtocol {
    private let networkingService = NetworkingServiceResolver.networkingService

    func get() async throws -> ___VARIABLE_sceneName___ {
        return try await networkingService.performAndDecode(
            target: ___VARIABLE_sceneName___Api.get
        )
    }
}
