import UIKit
//Extensions
//클래스나, 구조체, 열거형, 프로토콜 타입에 새 기능을 추가하는 것.
//extension 기존타입이름 {
    //새로운 기능
//}

//익스텐션에서 계산 프로퍼티를 추가할 수 있지만 저장 프로퍼티를 추가할 순 없다.
extension Double { // 더블타입에 새 기능 추가
    var squared: Double {
        return self * self //get{}생략
    }
    var km: Double {
        return self * 1000.0
    }
}
let value : Double = 3.0
print(value.squared) //9.0
let value2 = 3.0.squared
print(value2) //9.0
let value3 =  2.km
print(value3) //2000.0


//구조체 init 없을 때 두 가지 방법으로 호출 가능한 것을 보여주는 사례
struct Size {
    var width = 0.0, heigth = 0.0
}
struct Point{
    var x = 0.0, y = 0.0
}
struct Rect{
    var origin = Point()
    var size = Size()
}
let n1 = Rect() //모든 프로퍼티에 디폴트 값이 존재해서 가능한 것
let n2 = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, heigth: 5.0))
print(n1.origin) //Point(x: 0.0, y: 0.0)
print(n2.origin) //Point(x: 2.0, y: 2.0)

//구조채 Rect에 새 기능 추가
extension Rect {
    init(center: Point, size: Size){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.heigth / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let centerRect = Rect(center: Point(x: 3.0, y: 3.0), size: Size(width: 1.0, heigth: 1.0))
print(centerRect.origin) //Point(x: 2.5, y: 2.5)

//메소드 익스텐션
extension Int {
    func repetition (task: () -> Void) { //파라미터로 () -> Void 타입의 함수를 받음
        for _ in 0..<self {
            task()
        }
    }
}
func hello (){
    print("hello")
}
3.repetition(task: hello) //함수를 넣기
3.repetition(task: { () in return print("hello!")}) //클로저 사용
3.repetition { //trailing closure
    print("hello~")
}

//Protocols
//메서드나 프로퍼티(속성)에 대한 설계도
//프로토콜은 클래스, 구조체, 열거형 등에 의해 채택될 수 있다.
protocol name {
    //protocol 정의
}

/*
 프로포톨 적용 예)
 struct 구조체 이름: 프로토콜이름1, 프로토콜 이름2 {}
 class 킁래스 이름: superClass, 프로토콜이름1, 프로토콜이름2 {}
 프로퍼티의 경우 이름과 타입을 요구하며, 해당 프로퍼티가 gettable 혹은 gettable and settable인지 프로토콜에서 요구 가능.
 
 프로토콜에서 gettable and settable로 정의한 경우, 추후 구조체 및 함수에서 해당 프로퍼티가 상수인 저장 프로퍼티이거나 read-only 계산 프로퍼티라면 해당 조건에 충족되지 않음.
 프로토콜에서 프로퍼티를 gettable로 요구한 경우, 모든 프로퍼티가 요구사항을 만족할 수 있음.
 프로퍼티 요구사항 선언: var(변수로만)
 */
protocol ExampleProtocol {
    var age : Int {get set} //gettable and settable property
    var name : String {get} //gettable property
}
struct Animal: ExampleProtocol {
    var age : Int
    let name: String
}
var mon = Animal(age: 5, name: "monkey") //protocol conform

// 프로토콜에서의 함수 선언
protocol ExampleMethod {
    func eat()
}
//한 클래스(구조체)에서 여러 개의 프로토콜을 채택할 수 있음
struct Animal2: ExampleProtocol, ExampleMethod {
    var age : Int
    let name: String
    var food: String
    func eat (){
        print("\(name)s eat \(food)")
    }
}
var monkey = Animal2(age: 2, name: "monkey", food: "nuts")
monkey.eat() //monkeys eat nuts

/*
  프로토콜이 타입으로 쓰일 수 있다.
  함수의 파라미터 타입, 리턴 파팁, 메소드, initializer, 변수, 상수, 프로퍼티, 배열, 딕셔너리 등에 사용 가능
*/

//ExampleMethod 프로토콜을 상속받는 프로토콜
protocol FoodProtocol: ExampleMethod{
    var food : String {get set}
}
//FoodProtocol을 채택하는 구조체는 FoodProtocol과 ExampleMethod 프로토콜에 있는 메서드 및 함수를 구현해야 함.
struct FoodStruct : FoodProtocol {
    var food: String
    func eat(){
        print("\(food)")
    }
}
