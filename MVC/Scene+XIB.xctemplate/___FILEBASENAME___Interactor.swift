//___FILEHEADER___

import SharedComponents

protocol ___VARIABLE_sceneName___BusinessLogic: AnyObject {
    func loadSomething(request: ___VARIABLE_sceneName___.Request)
}

class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic {
    weak var controller: ___VARIABLE_sceneName___ControllerLogic?
    let service: SomeServiceProtocol = SomeServiceFactory.someService

    func loadSomething(request: ___VARIABLE_sceneName___.Request) {
        controller?.requestStarted()
        service.doRequest(request) { [weak self] response, error in
            guard let self = self else { return }
            if let error = error {
                self.controller?.presentError(message: error.localizedDescription)
            }
            if let response = response {
                let viewModel = ___VARIABLE_sceneName___.ViewModel()
                // TODO: fill viewModel
                self.controller?.didFinishRequest(viewModel: viewModel)
            } else {
                self.controller?.presentError(message: Text.Errors.RequestError)
            }
        }
    }
}
