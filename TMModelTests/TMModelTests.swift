//
//  TMModelTests.swift
//  TMModelTests
//
//  Created by CaptainTeemo on 3/17/16.
//  Copyright © 2016 CaptainTeemo. All rights reserved.
//

import XCTest
@testable import TMModel

class TMModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let dic = [
            "id": "4096",
            "name": "Teemo",
            "sampleArray": [1, 2, 3, 4, 5, 6],
            "sampleDic": ["lang": "Swift", "ver": "2.1"]
        ]
        
        let student = Student.generateModel(dic)
        // prints 4096
        print(student.id)
        // prints Teemo
        print(student.name)
        // prints [1, 2, 3, 4, 5, 6]
        print(student.sampleArray)
        // prints ["lang": "Swift", "ver": "2.1"]]
        print(student.sampleDic)
        
        let data = Student.convertToDictionary(student)
        // prints [
        //    "id": "4096",
        //    "name": "Teemo",
        //    "sampleArray": [1, 2, 3, 4, 5, 6],
        //    "sampleDic": ["lang": "Swift", "ver": "2.1"]
        //]
        print(data)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}

final class Student: NSObject, JSONConvertible {
    var id: String?
    var name: String?
    var sampleArray: [Int]?
    var sampleDic: [String: AnyObject]?
}
