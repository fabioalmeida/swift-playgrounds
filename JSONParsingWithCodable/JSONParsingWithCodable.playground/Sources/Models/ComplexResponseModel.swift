import Foundation

fileprivate struct RawComplexResponseModel: Codable {

    struct User: Codable {
        let first_name: String
        let last_name: String
    }

    struct AddressInfo: Codable {
        let id: Int
        let street: String
        let country: Country
    }

    struct Country: Codable {
        let id: Int
        let name: String
    }

    let id: Int
    let name_info: User
    let address_info: AddressInfo
}

public struct ComplexResponseModel: Codable {

    let id: Int
    let firstName: String
    let lastName: String
    let countryName: String
    let address: String?

    public init(from decoder: Decoder) throws {

        let rawResponseModel = try RawComplexResponseModel(from: decoder)

        id = rawResponseModel.id
        firstName = rawResponseModel.name_info.first_name
        lastName = rawResponseModel.name_info.last_name
        countryName = rawResponseModel.address_info.country.name
        address = rawResponseModel.address_info.street
    }
}
