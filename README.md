# TMModel
An elegant, protocol-oriented tool, help convert JSON to Model or vice versa.


## At a glance
```swift
final class Student: NSObject, JSONConvertible {
    var id: String?
    var name: String?
    var sampleArray: [Int]?
    var sampleDic: [String: AnyObject]?
}

let dic = [
    "id": "4096",
    "name": "Teemo",
    "sampleArray": [1, 2, 3, 4, 5, 6],
    "sampleDic": ["lang": "Swift", "ver": "2.1"]
]

let student = Student.generateModel(dic)
print(student.id)
// prints 4096

print(student.name)
// prints Teemo

print(student.sampleArray)
// prints [1, 2, 3, 4, 5, 6]

print(student.sampleDic)
// prints ["lang": "Swift", "ver": "2.1"]]

let data = Student.convertToDictionary(student)

print(data)
// prints [
//    "id": "4096",
//    "name": "Teemo",
//    "sampleArray": [1, 2, 3, 4, 5, 6],
//    "sampleDic": ["lang": "Swift", "ver": "2.1"]
//]
```

## Step by step
1. Make your model class inheritance from NSObject
2. Mark your class as final
3. Conform to protocol JSONConvertible
4. Declare all properties you need from JSON
5. Please check step 6
6. There's no step 6


