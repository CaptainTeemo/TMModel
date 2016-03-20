//
//  JSONConvertible.swift
//  TMModel
//
//  Created by CaptainTeemo on 3/17/16.
//  Copyright © 2016 CaptainTeemo. All rights reserved.
//

import Foundation

public protocol JSONConvertible {
    static func generateModel(data: [String: AnyObject]) -> Self
    static func convertToDictionary(model: Self) -> [String: AnyObject]
}

public extension JSONConvertible where Self: NSObject {
    
    init() {
        self.init()
    }
    
    /**
     Generate a model using a JSON dictionary.
     
     - parameter data: JSON dictionary.
     
     - returns: A model object with value assigned.
     */
    static func generateModel(data: [String: AnyObject]) -> Self {
        let model = Self()
        
        for (key, value) in data {
            guard model.respondsToSelector(Selector("\(key)")) else {
                continue
            }
            if let number = value as? NSNumber {
                model.setValue("\(number)", forKey: key)
            } else {
                model.setValue(value, forKey: key)
            }
        }
        return model
    }
    
    /**
     Convert given model to JSON dictionary.
     
     - parameter model: A model object.
     
     - returns: A JSON dictionary with properties' names as keys.
     */
    static func convertToDictionary(model: Self) -> [String: AnyObject] {
        var dic = [String: AnyObject]()
        var outCount: UInt32 = 0
        let properties = class_copyPropertyList(Self.self, &outCount)
        for i in 0..<Int(outCount) {
            let property = properties[i]
            guard let key = String(CString: property_getName(property), encoding: NSUTF8StringEncoding) else { continue }
            let value = model.valueForKey(key)
            dic[key] = value
        }
        return dic
    }
}