//___FILEHEADER___

import GeneralBusinessLogic

struct ___VARIABLE_entityName___ListRequest {
    let page: Int
}

struct ___VARIABLE_entityName___ListResponse: Decodable {
    let count: Int?
    let nextPageNumber: Int?
    let lastPageNumber: Int?
    var list: [___VARIABLE_entityName___]

    enum CodingKeys: String, CodingKey {
        case count
        case nextPageNumber = "next"
        case lastPageNumber = "previous"
        case list = "results"
    }
}