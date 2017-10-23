import Foundation
import PlaygroundSupport

public func loadFile(withName filename: String, fileType: String = "json") -> Data? {

    if let fileURL = Bundle.main.url(forResource: filename, withExtension: fileType) {

        do {
            let data = try Data(contentsOf: fileURL, options: .mappedIfSafe)
            return data

        } catch {}

    } else {

        print("[loadFile:withName] Invalid Path")
    }

    return nil
}

public func jsonFromData(_ data: Data) -> Dictionary<String, AnyObject>? {

    do {
        let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)

        if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {

            return jsonResult
        }

    } catch {}

    return nil
}
