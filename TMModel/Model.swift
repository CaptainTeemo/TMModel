//
//  Model.swift
//  TMModel
//
//  Created by CaptainTeemo on 3/17/16.
//  Copyright © 2016 CaptainTeemo. All rights reserved.
//

import Foundation

public protocol Model {
    /**
     Generate a model using a JSON dictionary.
     
     - parameter data: JSON dictionary.
     
     - returns: A model object with value assigned.
     */
    static func generateModel(data: [String: AnyObject]) -> Self
    
    /**
     Convert given model to JSON dictionary.
     
     - parameter model: A model object.
     
     - returns: A JSON dictionary with properties' names as keys.
     */
    static func convertToDictionary(model: Self) -> [String: AnyObject]
}

extension Model where Self: NSObject {
    
    init() {
        self.init()
    }
    
    static func generateModel(data: [String: AnyObject]) -> Self {
        let model = Self()
        data.forEach { model.setValue($1, forKey: $0) }
        return model
    }
    
    static func convertToDictionary(model: Self) -> [String: AnyObject] {
        var dic = [String: AnyObject]()
        var outCount: UInt32 = 0
        let properties = class_copyPropertyList(Self.self, &outCount)
        for i in 0..<Int(outCount) {
            let property = properties[i]
            if let key = String(CString: property_getName(property), encoding: NSUTF8StringEncoding) {
                let value = model.valueForKey(key)
                dic[key] = value
            }
        }
        return dic
    }
}