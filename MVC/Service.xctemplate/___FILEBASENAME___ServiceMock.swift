//___FILEHEADER___

import BusinessLogic

class ___VARIABLE_sceneName___ServiceMock: ___VARIABLE_sceneName___ServiceProtocol {
    func get(completion: @escaping (___VARIABLE_sceneName___?, Error?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            var result = ___VARIABLE_sceneName___(id: "0")
            completion(result, nil)
        }
    }
}
