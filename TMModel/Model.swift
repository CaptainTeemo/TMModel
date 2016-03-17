//
//  Model.swift
//  TMModel
//
//  Created by CaptainTeemo on 3/17/16.
//  Copyright © 2016 CaptainTeemo. All rights reserved.
//

import Foundation

protocol Model {
    static func generateModel(data: [String: AnyObject]) -> Self
    static func convertToDictionary(model: Self) -> [String: AnyObject]
}

extension Model where Self: NSObject {
    
    init() {
        self.init()
    }
    
    static func generateModel(data: [String: AnyObject]) -> Self {
        let model = Self()
        for (key, value) in data {
            model.setValue(value, forKey: key)
        }
        return model
    }
    
    static func convertToDictionary(model: Self) -> [String: AnyObject] {
        let mirror = Mirror(reflecting: model)
        var dic = [String: AnyObject]()
        for child in mirror.children {
            if let key = child.label, let value = unwrap(child.value) as? AnyObject {
                dic[key] = value
            }
        }
        return dic
    }
}

private func unwrap(subject: Any) -> Any? {
    var value: Any?
    let mirrored = Mirror(reflecting:subject)
    if mirrored.displayStyle != .Optional {
        value = subject
    } else if let firstChild = mirrored.children.first {
        value = firstChild.value
    }
    return value
}