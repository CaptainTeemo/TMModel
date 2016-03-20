# TMModel
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build Status](https://travis-ci.org/CaptainTeemo/TMModel.svg?branch=master)](https://travis-ci.org/CaptainTeemo/TMModel)

An elegant, protocol-oriented tool, help convert JSON to Model or vice versa.


## At a glance
```swift
final class Student: NSObject, JSONConvertible {
    var id = ""
    var name = ""
    var sampleDigit = 0
    var sampleArray = [Int]()
    var sampleDic = [String: AnyObject]()
}

let dic = [
    "id": "4096",
    "name": "Teemo",
    "sampleDigit": 666,
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
//]
```
## Requirements
* iOS 8.0+
* Xcode 7.2+

## Carthage
Put `github "CaptainTeemo/TMModel"` in your cartfile and run `carthage update` from terminal, then drag built framework to you project.

That's all.

## Step by step
1. Make your model class inheriting from NSObject
2. Mark your class as final
3. Conform to protocol JSONConvertible
4. Declare all properties you need from JSON
5. Please check step 6
6. There's no step 6


