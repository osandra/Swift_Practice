import UIKit
import SwiftUI

//Control Flow for in
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

//for loop
for score in individualScores {
    if score > 100 {
        teamScore += 10
    } else {
        teamScore += 1
    }
}
print(teamScore) //14

//for loop in using handy range operator(...)
var shoppingList = ["catfish", "water", "tulips", "water"]
for index in 0...3 {
    print(shoppingList[index])
}

for index in 0...shoppingList.count - 1 {
    print(shoppingList[index])
}
/*
 출력 결과:
 catfish
 water
 tulips
 water
 */

//if else 띄어쓰기 항상 유의.
if teamScore >= 15 {
    print("good!")
} else if teamScore >= 10 && teamScore < 15 {
    print("nice!")
    }
else {
    print("well!")
 }

let checkpositive = teamScore > 0 ? "it is positive number" : "it is negative number"
print(checkpositive) //it is positive number

//닫힌 범위 연산자(Closed Range Operator) : x...y x에서 시작 y로 끝난다.
var intArray: [Int] = Array(5...8) // [5, 6, 7, 8]
//반 닫힌 범위 연산자(Half-Open Range Operator): x..<y x에서 시작 y가 포함되지 않는 모든 숫자
intArray = Array(5..<8) // [5, 6, 7]

//switch: C와 달리 breck문을 적지 않아도, 처음 매칭되는 값을 찾으면 구문이 완료된다.
// if 보다 많은 경우의 수가 있을 때
switch teamScore {
    case 15...: //15이상이면
        print("good! switch")
    case 10...14: //10이상 14이하이면
        print("nice! switch")
    case 5,6,7,8,9: //5,6,7,8,9이면
        print("well! switch")
    default: //그 외 나머지 경우엔
        print("switch")
}
let fruit: String = "Apple"
switch fruit {
    case "Tangerine","Grape":
        print("\(fruit) is sweet")
    case "Apple","Banana":
        print("It's good to eat \(fruit) in the morning.")
    default:
        print("Is it Fruit?")
}

/*
 understanding optionals ? -> 값이 없어도(nil) 에러를 발생시키지 않기 위해
 옵셔널 타입이라는 객체로 감싸서 반환하는 것.
 swift에서 기본 자료형(int, double, string)은 nil값 저장할 수 없기에 nil도 저장하려먼 옵셔널 타입으로 선언해야 한다.
 nil 값 을 옵셔널이 아닌 변수나 상수에 할당할 수 없다.
 */
var jobTitle: String? //옵션인 값. 값이 없으면 nil(값이 없는 변수)가 출력된다.
print(type(of: jobTitle)) //Optional<String>
jobTitle = "iOS Developer"
//var message = "Your job title is " + jobTitle
// -> 처음에 선택적 변수로 선언해서 JobTitle에 값이 없을 수 있기 때문에 해당 라인에서 오류가 발생

//1. forced unwrapping 옵셔널 타입이라는 객체로 감싸서 반환함.
if jobTitle != nil { //값이 nil일 경우, Optional value로 wrap되지 않는다.
    let message = "Your job title is " + jobTitle!
    //옵션 값 뒤에 !를 추가하여 옵션 값 여부 확인할 필요없이 자동으로 unwrap.
    print(message) //Your job title is iOS Developer
}

//2. Optional Binding -> no need to add the ! suffix.
if let jobTitleWithValue = jobTitle {
    // 옵셔녈 변수 값이 있으면 언래핑해서 상수에 해당 값을 대입하고 if 문 실행
    // 값이 없다면 if 문 실행 X
    let message2  = "Your job title is " + jobTitleWithValue
    print(message2) //Your job title is iOS Developer
}

let converToNum = Int(jobTitle!) //nil "iOS Developer" 는 숫자로 못 바꾸니까
let optionalExample2: Int? = 3 //optionalExample2 는 Int이거나 nil값을 가질 수 있다.


// Nil 병합 연산자(Nil-Coalescing Operator)
// 형태:  a ?? b
// 옵셔널변수 ?? 옵셔널변수가 nil값일 때 할당되는 값
var nickname: String? = nil
let fullName: String = "John Appleseed"
//nickname에 값이 없으면 fullName을 보여주기. 값이 있으면 닉네임만 보임.
let informalGreeting = "Hi \(nickname ?? fullName)" //"Hi John Appleseed"

var favoriteNum: Int?
favoriteNum = 3
print(favoriteNum) // Optional(3)
print(favoriteNum ?? 7) // 3

//dictionary example
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0

//_ : key value 쓸 일 없으면 _로 생략 가능
for (_,numbers) in interestingNumbers{
    for number in numbers {
        if largest < number {
            largest = number
        }
    }
}
print(largest) //25

//While loop 조건이 거짓일 때까지 반복
var n = 2
while n < 2 {
    n *= 2
}
print(n) // 2

//Repear-While 한 번 실행한 한 후 조건이 거짓일 때까지 반복
var m = 2
repeat {
    m *= 2
} while m < 2
print(m) //4

//guard: Early Exit
func multiplyByTen(value: Int?){
    guard let number = value, number < 10 else {
        //조건식이 거짓일 때 실행
        print("수가 10보다 크다")
        return
    }
    print(number) //조건식이 참일 때 실행
}
multiplyByTen(value: 3) //3
