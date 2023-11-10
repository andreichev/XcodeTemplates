// ___FILEHEADER___

class ___VARIABLE_sceneName___Interactor {
    weak var controller: ___VARIABLE_sceneName___ControllerLogic?
    private let service: SomeServiceProtocol = SomeServiceResolver.someService

    func loadSomething() {
        Task {
            do {
                try await service.loadSomething()
                await MainActor.run {
                    controller?.didFinishRequest()
                }
            } catch {
                await MainActor.run {
                    controller?.presentError(message: error.localizedDescription)
                }
            }
        }
    }
}
