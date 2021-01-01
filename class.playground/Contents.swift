import UIKit
/*
 structure: struct 키워드로 시작, 상속 불가, value type
 class: class 키워드로 시작, 상속 가능, reference type
 
 value type: 변수나 상수에 값(함수,클래스 등)을 배정할 때, 복사된 인스턴스와 복사한 인스턴스는 완전히 다른 인스턴스로 존재하는 것. 만약 복사한 인스턴스의 값을 바꾼다해도, 복사된 인스턴스의 값이 변하지 않음.
 
 reference type: 변수나 상수에 값을 배정할 때 값을 복사하는 것이 아니라, 해당 값으로 넘겨지는 것. 즉 데이터가 담긴 인스턴스를 공유하게 된다. 한 인스턴스의 값을 바꾸면, 다른 나머지 인스턴스 값도 바뀐다.
 */

// Struct : value type
struct PersonStruct {
    var name: String? //stored property(속성)
    var age: Int? //stored property(속성)
    let graduation: Bool? //상수는 변경 불가
    init(name:String, age:Int, graduation: Bool) {
        self.name = name //self.name은 클래스 내 name 프로퍼티를 가리키는 것
        self.age = age // 인자와 클래스 프로퍼티의 이름이 같을 경우, 둘을 구분하기 위해 인스턴스의 프로퍼티는 self.프로퍼티로 표시
        self.graduation = graduation
    }
}
// 인스턴스 생성
var hyeon = PersonStruct(name: "hyeon", age: 34, graduation: false)
var hyeon2 : PersonStruct = PersonStruct(name: "hyeon", age: 34, graduation: false) // 인스턴스 생성 방법 2

// copy instance
var valueCopy = hyeon
valueCopy.age = 54
if let age = hyeon.age {
    print(age) //34
}
if let age = valueCopy.age {
    print(age) //54
}

// Class : refernece type
class PersonClass {
    var name: String?
    var age: Int?
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
}
var yoon = PersonClass(name: "yoon", age: 34)
//reference instance
var referenceCopy = yoon
var ref = yoon
referenceCopy.age = 54 //. 을 이용해 프로퍼티에 새 값 배정
if let age = yoon.age {
    print(age) //54
}
if let age = referenceCopy.age {
    print(age) //54
}

//두 개의 변수가 같은 인스턴스를 참조하는 지 확인하려면 === 연산자 사용
if referenceCopy === ref {
    print("same instance") // same instance
}

class Man {
    // stored propery: age, weight -> 인스턴스 프로퍼티
    var age : Int = 15  // 옵셔녈타입이 아니라면 초기값을 가져야 함
    var weight : Double = 80.6
    // 타입 propery
    static var graduation : Bool = false
    // 메서드
    func display(){
        print("나이= \(age), 몸무게=\(weight)")
    }
    // 타입 메서드 : class, static
    class func classMethod(){ // 자식 클래스에서 override 가능
        print("class Method!")
    }
    static func staticMethod(){ // 자식 클래스에서 override 불가
        print("static Method!")
    }
}
var jinsuk = Man()
jinsuk.display() // 메서드 실행. 나이= 15, 몸무게=80.6
print(jinsuk.age) //15
print(Man.graduation) //false
Man.graduation = true
print(Man.graduation) //true
Man.classMethod() //class Method!
Man.staticMethod() //static Method!

struct Animal {
    var age: Int //stored property
    var name: String //stored property
    static var inSeoul : Bool? //type property
    //computed property: 계산된 값을 리턴하는 getter 와 새로운 값을 지정하는 setter
    var americanAge : Int {
        get { //set이 없을 경우 get{} 생략이 가능함
            return age-1
        }
        set(newAge){   //setter의 매개변수명이 newValue(디폴트 이름)인 경우에만 (newAge)생략 가능
            age = newAge
        }
        /*
        set {
         age = newValue
         }
        */
    }
    //getter 만 있는 computed property를 Read-Only Property라 부름
    var lowerCase : String {
        return name.lowercased() //read-only computed property 일 경우 get {} 생략 가능
    }
    //구조체에서 메소드를 통해 프로퍼티 값을 바꾸려면 mutating을 앞에 붙여야 함.
    mutating func addTwo(){
        age = age + 2
    }
}
var quokka = Animal(age: 3, name: "Quokka") //구조체는 init 선언 안할 경우, 자동적으로 memberwise initialzer 받음
var lion = Animal(age: 6, name: "LION")
print(lion.americanAge) //5 getter호출
lion.americanAge = 10 //setter
print(lion.age) //10
print(lion.americanAge) //9
print(quokka.lowerCase) //quokka

print(Animal.inSeoul) //nil -> type method
Animal.inSeoul = true
if let Seoul = Animal.inSeoul{
    print(Seoul) //true
}

quokka.addTwo()
print(quokka.age) //5
