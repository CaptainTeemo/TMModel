//
//  Model.swift
//  TMModel
//
//  Created by CaptainTeemo on 5/10/16.
//  Copyright © 2016 CaptainTeemo. All rights reserved.
//

import Foundation
import TMModel

final class Student: NSObject, JSONConvertible {
    var id = ""
    var name = ""
    var sampleDigit = 0
    var sampleFloat: Float = 0
    var sampleArray = [Int]()
    var sampleDic = [String: AnyObject]()
}

final class User: NSObject, JSONConvertible {
    var id = ""
    var name = ""
    var email = ""
    var address = [String: AnyObject]()
    var phone = ""
    var website = ""
    var company = [String: AnyObject]()
    
    func printDescription() {
        print("id: \(id)\n name: \(name)\n email: \(email)\n address: \(address)\n phone: \(phone)\n website: \(website)\n company: \(company)")
    }
}