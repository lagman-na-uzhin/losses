

import Foundation

struct APIError: Decodable {
    var message: String
}

struct AuthError: Decodable {
    var message: String
    var invalidFields: [String]?
}
