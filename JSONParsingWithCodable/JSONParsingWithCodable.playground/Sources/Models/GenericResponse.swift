import Foundation

public struct GenericResponse<T:Codable>: Codable {

    let statusCode: Int
    let result: T
}
