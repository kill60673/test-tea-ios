//
//

import Foundation

struct MemberInfoCodable: Codable {
    var result: Int
    var message: Message?

    struct Message: Codable {

        var username: String
        var email: String
        var phone: String
        var name: String
        var point: Int
        var address: String
//        var loveaddress: [String]

    }

    enum QuantumValue: Decodable {

        case string(String), array([String])

        init(from decoder: Decoder) throws {
            if let string = try? decoder.singleValueContainer().decode(String.self) {
                self = .string(string)
                return
            }

            if let array = try? decoder.singleValueContainer().decode([String].self) {
                self = .array(array)
                return
            }

            throw QuantumError.missingValue
        }

        enum QuantumError: Error {
            case missingValue
        }
    }

}
