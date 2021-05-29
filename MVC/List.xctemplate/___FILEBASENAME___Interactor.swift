//___FILEHEADER___

protocol ___VARIABLE_sceneName___BusinessLogic: AnyObject {
    func loadList(page: Int)
}

class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic {
    weak var controller: ___VARIABLE_sceneName___ControllerLogic?
    let service: ___VARIABLE_sceneName___ServiceProtocol = ___VARIABLE_sceneName___ServiceFactory.service

    func loadList(page: Int) {
        service.get___VARIABLE_entityName___s(page: page) { [weak self] response, error in
            guard let self = self else { return }
            if let error = error {
                self.controller?.presentError(message: error.localizedDescription)
                return
            }
            if let response = response {
                self.controller?.displayList(response: response)
            } else {
                self.controller?.presentError(message: Text.Errors.requestError)
            }
        }
    }
}