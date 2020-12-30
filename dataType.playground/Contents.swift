import UIKit
import SwiftUI

//변수 선언
var str = "Hello world"
print(str) //출력방법
str.lowercased() //소문자로

//var은 변경 가능
var constant = 30.1
constant = 50.1

//상수 선언 (변경 불가)
let val = 30

//type 지정 안 할 시 컴파일러가 타입 추론을 하므로 데이터 타입을 명시할 필요 없음.
print(type(of: val)) //Int
print(type(of: constant)) //Double

//"" 안에 변수 작성 법
var totalMember = "Total: \(constant)member!"


// Bool, Int UInt, Float, Double, Character, String, list, dictionary
var roly: Bool = true
print(roly) //true
// var roly: Bool = 0 불가

var integarExample: Int = -10000
var positive : UInt = 100 //양수만
var floatExample: Float = 10000.01 //32-bit 소수점 6자리 정확도. 10000.01.
var floatExample2: Float = 100000.01 //100000
var doubleExample: Double = 10000000.01 //64-bit 소수점 15자리 정확도. 10000000.01

// Character: 한 글자 문자 ""만 가능. '' 안 됨.
var justOneCharacter : Character = "g"

// String
var strExample = "Hello world"
// String append
strExample.append("!")
print(strExample) //Hello world!
strExample.count //12 공백포함
// String Indices
strExample[strExample.startIndex] //"H"
strExample[strExample.index(after: strExample.startIndex)] //"e"
strExample[strExample.index(before: strExample.endIndex)] //"!"

//Any 모든 타입을 담을 수 있음. 클래스, 구조체, 열거형, 함수타입도 가능
var example: Any? //nil
example = "text"
example = 22222
example = [1,2,3,57,8]

// Array
// Create empty array
var emptyArray = [String]() //[] string형 빈 array
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] //indexing -> water
shoppingList[0...1] // ["catfish", "water"]
shoppingList.count //3

//Array 요소 추가
shoppingList.append("kimchi") //맨 뒤에 요소 추가 ["catfish", "water", "tulips", "kimchi"]
shoppingList.insert("egg", at: 0) //0번째에 egg요소 추가

//Array 요소 삭제
shoppingList.removeLast() //맨 마지막 요소 삭제
shoppingList.remove(at: 0) //0번째에 위치한 요소 삭제
print(shoppingList) // ["catfish", "water", "tulips"]


//Set -> distinct value , no order
//Create empty set
var emptySet = Set<String>() //[] string형 빈 set
var device: Set<String> = ["mouse", "keyboard", "laptop"]
device.insert("headphones") //(inserted true, memberAfterInsert "headphones")
device.insert("mouse") //(inserted false, memberAfterInsert "mouse") -중복된 값 X
print(device) //["keyboard", "laptop", "headphones", "mouse"]
//Set을 이용해 합집합, 차집합, 교집합 확인 가능


//Dictionary -> unique key, no order
//Create empty dictionary
var emptyDic = [String:Float]() //[:] key type: String, value type: Float
var dicExample = [
    "mika":"developer",
    "noy":"marketer",
]
dicExample["Jane"] = "professor"
print(dicExample["Jane"]) // Optional("professor"). 딕셔너리는 옵셔널 타입을 반환함.
print(dicExample["Jane"]!) //professor
print(dicExample["new"]) //해당 키로 등록된 값이 없으면 nil 반환.

print(dicExample) //["Jane": "professor", "mika": "developer", "noy": "marketer"]
dump(dicExample) //more detail info. 3key/value pairs + each info

// Initialize a new array with the keys or values property
let jobs = [String](dicExample.values) // ["professor", "developer", "marketer"]

for (key, value) in dicExample {
    print("name: \(key)")
    print("job: \(value)")
}

//practice using Dictionary
var emogiDict: [String: String] = ["🐭":"Rabbit",
                                   "🦁":"Lion",
                                   "😀":"Happy",
                                   "👻":"Ghost",
                                   "💩":"Poop"
                                    ]
var wordToLookup = "🦁"
var meaning = emogiDict[wordToLookup]

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
containerView.backgroundColor = UIColor.orange
//containerView is empty now

let emojiLabel = UILabel(frame: CGRect(x: 95, y: 30, width: 150, height: 150))
emojiLabel.text = wordToLookup
emojiLabel.font = UIFont.systemFont(ofSize: 100.0)
containerView.addSubview(emojiLabel)

let meaningLabel = UILabel(frame: CGRect(x: 110, y: 100, width: 150, height: 150))
meaningLabel.text = meaning
meaningLabel.font = UIFont.systemFont(ofSize: 30)
meaningLabel.textColor = UIColor.white
containerView.addSubview(meaningLabel)
