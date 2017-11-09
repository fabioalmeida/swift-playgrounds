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
// -------- Different Names Example -----------
// --------------------------------------------

// different names example
// if you look at the implementation of DifferentNamesModel, you can see one important thing:
// An enum which conforms to CodingKey is declared, stating the different names 
// This enum needs to be exhaustive, and if you don't want to write a custom intitializer, call it CodingKeys
if let data6 = loadFile(withName: "DifferentNames/different_names_1") {

    let model = try? JSONDecoder().decode(DifferentNamesModel.self, from: data6)
    print(model as Any)
    print("----- Example 6 ----- \n")
}




// --------------------------------------------
// ---------- Nested Models Examples ----------
// --------------------------------------------

// nested models example
// if you look at the implementation of GenericResponse, you can see one important thing:
// The result has a generic type which implements the Codable protocol, and this model implements the codable itself
// With this, we can easily have a generic response with any type of object we want to parse
if let data7 = loadFile(withName: "NestedModels/nested_model_1") {

    let model = try? JSONDecoder().decode(GenericResponse<DifferentNamesModel>.self, from: data7)
    print(model as Any)
    print("----- Example 7 ----- \n")
}

// nested models example
// similarly to the previous example, we can have a reponse with an array of objects that also conform to Codable
if let data8 = loadFile(withName: "NestedModels/nested_model_2") {

    let model = try? JSONDecoder().decode(GenericResponse<[SimpleModel]>.self, from: data8)
    print(model as Any)
    print("----- Example 8 ----- \n")
}





// --------------------------------------------
// -------- Complex Responses Examples --------
// --------------------------------------------

// complex responses example
// if you look at the implementation of ComplexResponseModel
// you can check that we are overriding the `init(from decoder: Decoder)` method
// instead of parsing all fields one by one, we created a Raw model that represents the json structure
// with all its nested objects; then we decode this object which also conforms to Codable and just access its properties
if let data9 = loadFile(withName: "ComplexResponses/complex_response") {

    let model = try? JSONDecoder().decode(ComplexResponseModel.self, from: data9)
    print(model as Any)

    print("----- Example 9 ----- \n")
}
