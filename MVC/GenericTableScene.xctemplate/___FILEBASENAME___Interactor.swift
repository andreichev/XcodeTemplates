// ___FILEHEADER___

protocol ___VARIABLE_sceneName___BusinessLogic: AnyObject {
    func load___VARIABLE_entityName___()
}

final class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic {
    weak var controller: ___VARIABLE_sceneName___ControllerLogic?
    private let service: SomeServiceProtocol = SomeServiceResolver.someService

    func load___VARIABLE_entityName___() {
        Task {
            do {
                let response = try await service.get()
                self.controller?.present___VARIABLE_entityName___(response)
            } catch {
                await MainActor.run {
                    controller?.presentError(message: error.localizedDescription)
                }
            }
        }
    }
}
