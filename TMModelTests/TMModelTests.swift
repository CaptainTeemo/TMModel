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
    
    func testLocal() {
        let dic = [
            "id": "4096",
            "name": "Teemo",
            "sampleDigit": 666,
            "sampleFloat": 0.22222,
            "sampleArray": [1, 2, 3, 4, 5, 6],
            "sampleDic": ["lang": "Swift", "ver": "2.1"]
        ]
        
        let student = Student.generateModel(dic)
        XCTAssert(student.id == "4096")
        XCTAssert(student.name == "Teemo")
        XCTAssert(student.sampleDigit == "666")
        XCTAssert(student.sampleFloat == "0.22222")
        XCTAssert(student.sampleArray == [1, 2, 3, 4, 5, 6])
        XCTAssert(student.sampleDic["lang"] as? String == "Swift")
        XCTAssert(student.sampleDic["ver"] as? String == "2.1")
        
        let data = student.convertToDictionary()
        print(data)
    }
}
