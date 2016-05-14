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
    var sampleDigit = ""
    var sampleFloat = ""
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

public final class Media: NSObject, JSONConvertible {
    public var type = ""
    public var videos = [String: AnyObject]()
    public var users_in_photo = [String: AnyObject]()
    public var filter = ""
    public var tags = [String]()
    public var comments = [String: AnyObject]()
    public var caption = ""
    public var likes = [String]()
    public var link = ""
    public var user = [String: AnyObject]()
    public var created_time = ""
    public var images = [String: AnyObject]()
    public var id = ""
    public var location = ""
}