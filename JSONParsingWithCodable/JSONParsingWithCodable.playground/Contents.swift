//: Playground - noun: a place where people can play

// Official documentation: https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types

import UIKit

// direct conversion example
// we are loading a file exactly similar to the model we want to create
if let data1 = loadFile(withName: "DirectConversion/direct_conversion_1") {

    let model = try JSONDecoder().decode(SimpleModel.self, from: data1)
    print(model)
    print("----- Example 1 ----- \n")
}

// direct conversion example
// now in the example we don't have the last field, which is optional
if let data2 = loadFile(withName: "DirectConversion/direct_conversion_2") {

    let model = try JSONDecoder().decode(SimpleModel.self, from: data2)
    print(model)
    print("----- Example 2 ----- \n")
}

// direct conversion example
// now in the example we don't have one of the required fields (which is non-optional) so the struct is not decoded
if let data3 = loadFile(withName: "DirectConversion/direct_conversion_3") {

    let model = try? JSONDecoder().decode(SimpleModel.self, from: data3)
    print(model ?? nil)
    print("----- Example 3 ----- \n")
}


