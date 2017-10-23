//: Playground - noun: a place where people can play

// Official documentation: https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types

import UIKit

// --------------------------------------------
// -------- Direct Matching Examples ----------
// --------------------------------------------

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

    let model = try? JSONDecoder().decode(SimpleModel.self, from: data3) as SimpleModel
    print(model as Any)
    print("----- Example 3 ----- \n")
}

// direct conversion example
// now in the example we have an array of SimpleModel objects
// IMPORTANT NOTE: if one of the objects fails, the full array will fail as well
if let data4 = loadFile(withName: "DirectConversion/direct_conversion_array") {

    let models = try JSONDecoder().decode([SimpleModel].self, from: data4) as [SimpleModel]
    print(models)
    print("----- Example 4 ----- \n")
}

// direct conversion example
// now in the example we have a dictionary of SimpleModel objects
// IMPORTANT NOTE: if one of the objects fails, the full dictionary will fail as well
if let data5 = loadFile(withName: "DirectConversion/direct_conversion_dictionary") {

    let models = try JSONDecoder().decode([String : SimpleModel].self, from: data5)
    print(models)
    print("----- Example 5 ----- \n")
}



// --------------------------------------------
// -------- Different Names Examples ----------
// --------------------------------------------

// different names example
// if you look at the implementation of DifferentNamesModel, you can see one important things:
// An enum which conforms to CodingKey is declared, stating the different names 
// This enum needs to be exhaustive, and if you don't want to write a custom intitializer, call it CodingKeys
if let data6 = loadFile(withName: "DifferentNames/different_names_1") {

    let model = try? JSONDecoder().decode(DifferentNamesModel.self, from: data6)
    print(model as Any)
    print("----- Example 6 ----- \n")
}
