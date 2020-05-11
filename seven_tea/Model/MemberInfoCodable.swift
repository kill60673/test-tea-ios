//
//

import Foundation

struct MemberInfoCodable: Codable {
    var success: Bool
    var message: String
    var data: [data]

    struct data: Codable {
        var picture_url: String
        var username: String
        var name: String
        var gender: String
        var email: String
        var phone: String
        var email_validated: Int
        var address: [address]
        struct address: Codable {
            var id: String
            var zipcode: String
            var city: String
            var district: String
            var address: String
        }
    }
}
