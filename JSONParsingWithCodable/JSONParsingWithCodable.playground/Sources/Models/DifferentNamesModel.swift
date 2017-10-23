import Foundation

public struct DifferentNamesModel: Decodable {

    let firstName: String
    let lastName: String
    let url: URL

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case url
    }

    // NOTE: No need for this initializer if the enum is called CodingKeys
    // and only the property names are different
    /*
     public init(from decoder: Decoder) throws {

     // defining our container (keyed)
     let container = try decoder.container(keyedBy: DifferentNamesModelKeys.self)

     // extract the data
     let firstName: String = try container.decode(String.self, forKey: .firstName)
     let lastName: String = try container.decode(String.self, forKey: .lastName)
     let url: URL = try container.decode(URL.self, forKey: .url)

     self.init(firstName: firstName, lastName: lastName, url: url)
     }
     */
}

//extension DifferentNamesModel: Decodable {
//
//    enum CodingKeys: String, CodingKey {
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case url
//    }
//

//}

