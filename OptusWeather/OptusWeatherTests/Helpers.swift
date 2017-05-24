//
//  Helpers.swift
//  OptusWeather
//
//  Created by Vijay Santhanam on 24/05/2017.
//  Copyright © 2017 Vijay Santhanam. All rights reserved.
//

import Foundation

/// Parse JSON into dictionary
func parseJson(json:String) -> [String:Any] {
    let jsonData = json.data(using: .utf8)!
    let jsonRoot = try! JSONSerialization.jsonObject(with: jsonData)
    return jsonRoot as! [String:Any]
}

/// Load JSON file from test bundle
func loadJsonFile(fileName:String) -> String {
    let bundle = Bundle(for: JsonDeserializeTests.self)
    let jsonFile = bundle.path(forResource: fileName, ofType: "json")!
    let jsonString = try! String(contentsOfFile: jsonFile, encoding: .utf8)
    return jsonString
}
