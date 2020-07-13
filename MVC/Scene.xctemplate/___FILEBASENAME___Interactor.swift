//___FILEHEADER___

import SharedComponents
import BusinessLogic

protocol ___VARIABLE_sceneName___BusinessLogic: AnyObject {
    func loadSomething()
}

class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic {
    weak var controller: ___VARIABLE_sceneName___ControllerLogic?
    let service: SomeServiceProtocol = SomeServiceFactory.someService

    func loadSomething() {
        service.doRequest { [weak self] response, error in
            guard let self = self else { return }
            if let error = error {
                self.controller?.presentError(message: error.localizedDescription)
            }
            if let response = response {
                let viewModel = ___VARIABLE_sceneName___.ViewModel()
                // TODO: fill viewModel
                self.controller?.didFinishRequest(viewModel: viewModel)
            } else {
                self.controller?.presentError(message: Text.Errors.requestError)
            }
        }
    }
}
