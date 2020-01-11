//___FILEHEADER___

import SharedComponents

protocol ___VARIABLE_sceneName___BusinessLogic {
    func load___VARIABLE_entityName___()
}

class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic {
    var controller: ___VARIABLE_sceneName___ControllerLogic
    let someService: SomeServiceProtocol = SomeServiceFactory.someService

    init(controller: ___VARIABLE_sceneName___ControllerLogic) {
        self.controller = controller
    }

    func load___VARIABLE_entityName___() {
        someService.get { [weak self] response, error in
            guard let self = self else { return }
            if let error = error {
                self.controller.presentError(message: error.localizedDescription)
            }
            if let response = response {
                self.controller.present___VARIABLE_entityName___(response)
            } else {
                self.controller.presentError(message: Text.Error.requestError)
            }
        }
    }
}
