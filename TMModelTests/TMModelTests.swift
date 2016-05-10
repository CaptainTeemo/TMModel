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
        print(student.id)
        // prints 4096
        print(student.name)
        // prints Teemo
        print(student.sampleDigit)
        // prints 666
        print(student.sampleFloat)
        // prints 0.22222
        print(student.sampleArray)
        // prints [1, 2, 3, 4, 5, 6]
        print(student.sampleDic)
        // prints ["lang": "Swift", "ver": "2.1"]]
        
        let data = Student.convertToDictionary(student)
        print(data)
        // prints [
        //    "id": "4096",
        //    "name": "Teemo",
        //    "sampleDigit": 666,
        //    "sampleArray": [1, 2, 3, 4, 5, 6],
        //    "sampleDic": ["lang": "Swift", "ver": "2.1"]
        // ]
    }
    
    func testRemote() {
        func requestTestApi(done: ([[String: AnyObject]]) -> Void, failed: (NSError?) -> Void) {
            NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: "http://jsonplaceholder.typicode.com/users")!) { (data, response, error) -> Void in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    guard let d = data else {
                        failed(error)
                        return
                    }
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(d, options: .MutableLeaves) as! [[String: AnyObject]]
                        done(json)
                    } catch let parseError as NSError {
                        failed(parseError)
                    }
                })
            }.resume()
        }
        
        let expectation = self.expectationWithDescription("remote")
        
        requestTestApi({ (result) -> Void in
            for json in result {
                let user = User.generateModel(json)
                user.printDescription()
                
                let data = user.convertToDictionary()
                print(data)
            }
            
            expectation.fulfill()
            }) { (error) -> Void in
                print(error?.description)
                expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(30, handler: nil)
    }
}
