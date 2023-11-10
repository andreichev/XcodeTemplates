// ___FILEHEADER___

protocol ___VARIABLE_sceneName___BusinessLogic: AnyObject {
    func loadList(page: Int)
}

final class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic {
    weak var controller: ___VARIABLE_sceneName___ControllerLogic?
    private let service: ___VARIABLE_sceneName___ServiceProtocol = ___VARIABLE_sceneName___ServiceResolver.service
    private let pageSize: Int = 30

    func loadList(page: Int) {
        Task {
            do {
                let request = Get___VARIABLE_entityName___Request(
                    page: page, size: pageSize
                )
                let response = try await service.get___VARIABLE_entityName___s(request: request)
                await MainActor.run {
                    controller?.displayList(
                        loadedPage: page,
                        nextPage: response.count < pageSize ? nil : page + 1,
                        response: response
                    )
                }
            } catch {
                await MainActor.run {
                    controller?.presentError(message: error.localizedDescription)
                }
            }
        }
    }
}
