import UIKit

/*
 클로저는 전달되고, 코드 상에서 사용이 가능한 self-contained blocks
 클로저는 세 가지 형태를 취한다.
 1. Global functions(전역함수): 이름 있고, 값을 참조 및 캡쳐할 수 없다. global scope에서 정의되는 함수.
 2. Nested function: 이름 있고, 둘러싸인 함수 내의 값을 참조 및 캡쳐할 수 있다. 함수 안에서 정의되는 또 다른 함수를 말한다.
    A함수 내부에 nested function인 B함수가 있으면, B함수는 A의 변수 및 인자에 접근이 가능한 것.
 3. Closure expressions: unnamed(익명) closures, 주변의 값 참조 및 캡쳐 가능

 - Capturing Values: original scope이 사라져도, 해당 바디 안에서 변수와 상수를 참조 및 수정할 수 있다. 그 예로, nested function은 외부 함수의 인자룰 캡쳐하고 수정할 수 있다.

 Closure Expressions: 보다 간결하게 표현할 수 있음.
 in 키워드 이후에 클로저 바디 시작함.
 {
 (파라미터) -> 리턴 타입 in
    // body of the closure begin
    실행할 코드
 }
 */

func addFn (firstEle: Int, secondEle: Int) -> Int {
    return firstEle + secondEle
}

// 변수에 클로저 저장 후 호출 시 매개변수 이름 사용 X.
let add = { (firstEle: Int, secondEle: Int)-> Int in
    return firstEle + secondEle
}
let closureExample = add(10,20)
let addFnExample = addFn(firstEle: 10, secondEle: 20)

//마지막 매개변수에 함수가 들어가는 함수
func plus (firstEle: Int, secondEle: Int, cal: (Int, Int) -> Int) -> Int {
    return cal(firstEle, secondEle)
}
let a = plus(firstEle: 2,secondEle: 5, cal: add) //7

// using closure: 함수 매개변수 자리에 closure 넣기
let useClosing = plus(firstEle: 3, secondEle: 4, cal: {(val1: Int, val2: Int) -> Int in
    return val1 + val2
}) //7

// trailing closure: 마지막 매개변수가 함수인 경우, 함수를 매개변수로 전달하지 않고 대신 trailing closure를 함수의 호출이 끝나는 직후 작성할 수 있다.
let trailingClosure = plus(firstEle: 4, secondEle: 3){
    (val1: Int, val2: Int) -> Int in
    return val1 + val2
} //7

//map 함수에서 클로저 사용. map 함수: 모든 요소를 수정하고 결과를 리턴.
let array = [2,3,5,6]
let double = array.map({(value: Int) -> Int in return 2 * value })
print(double) //[4, 6, 10, 12]
// 인라인 클로저 표현식일 경우 넘겨받는 인자를 통해 타입을 파라미터 타입 추론할 수 있고, 리턴 값 또한 해당 식을 통해 추론할 수 있다.
let returnTypeOmit = array.map({(value: Int) in return 2 * value }) //리턴 타입 생략
let parameterOmit = array.map({value in return 2 * value }) //파라미터, 리턴 타입 생략
print(returnTypeOmit) //[4, 6, 10, 12]
print(parameterOmit) //[4, 6, 10, 12]

// 단일 표현식을 리턴할 경우, return 키워드 생략 가능
let returnOmit = array.map({value in 2 * value })
print(returnOmit) //[4, 6, 10, 12]
func noReturn(name: String) -> String {
    "Hi \(name)!"
}
print(noReturn(name: "pencil")) //Hi pencil!

// 매개변수 이름을 $0, $1, $2등의 이름으로 간단하게 작성 가능
let characterArray = ["a","b","c","d"]
let doubleCharacter = characterArray.map({char in char + char})
print(doubleCharacter) // ["aa", "bb", "cc", "dd"]
let shorthandCharacter = characterArray.map({$0 + $0})
print(shorthandCharacter) // ["aa", "bb", "cc", "dd"]
// Trailing closures
let shorthandAndTrailing = characterArray.map(){$0 + $0}
print(shorthandAndTrailing) // ["aa", "bb", "cc", "dd"]
