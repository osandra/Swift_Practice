//Type Casting: 인스턴스 타입 체크 및 인스턴스가 같은 클래스의 인스턴스 인지 확인

//A클래스를 상속받은 B클래스와 C클래스가 있다.
//B클래스 인스턴스와 C클래스 인스턴스를 배열의 원소로 가지는 상수(변수)의 타입은 Array<A> 가 된다. 즉 B클래스의 인스턴스와 C클래스의 인스턴스의 부모클래스인 A타입을 갖게 되는 것임. 만약 본래의 타입(자식클래스)을 갖게 해주고 싶다면, downcasting해야 함.

class BaseLanguage { // base class인 BaseLanguage
    var name: String;
    init(name: String){
        self.name = name
    }
}
class Language: BaseLanguage { //클래스 BaseLanguage를 상속받는 클래스 Language
    var writingSystem: String
    init(name: String, writingSystem:String){
        self.writingSystem = writingSystem
        super.init(name: name)
    }
}
class Programming: BaseLanguage { //클래스 BaseLanguage를 상속받는 클래스 Programming
    var designer: String
    init(name: String, designer:String){
        self.designer = designer
        super.init(name: name)
    }
}
let languageArray = [
    Language(name: "Korean", writingSystem: "Hangul"),
    Language(name: "English", writingSystem: "Latin script"),
    Programming(name: "Python", designer: "Guido van Rossum"),
    Programming(name: "Swfit", designer: "Chris Lattner")
]
print(type(of: languageArray)) //Array<BaseLanguage>

//type check operator: is (해당 인스턴스가 특정 하위 클래스 유형인지 확인)
let python = Programming(name: "Python", designer: "Guido van Rossum")
print(python is Language) //false
print(python is Programming) //true
print(python is BaseLanguage) //true

/*
Downcasting: 부모인스턴스 as?(as!) 자식클래스 -> 자식클래스로 변환하는 데 사용
as? 는 다운캐스팅하려는 타입의 옵셔널 값을 반환하는 조건부 형태. 다운캐스팅이 어려운 경우엔 nil값 반환
as! 는 강제로 다운캐스팅을 시도하는 것. 값이 있으면 값 자체만 반환하지만 잘못된 클래스타입을 다운캐스팅 시도할 경우 런타임에러 발생

- 에러 발생 예시 -
 for language in languageArray {  // Programming 클래스의 designer 프로퍼티에 접근하려면 현재 language의 타입은 BaseLanguage이므로 형변환이 필요함
    print("\(language.designer)") //value of type 'BaseLanguage' has no member 'designer'
}
*/
for language in languageArray {
    if let progrmaming = language as? Programming { //부모인스턴스 as? 자식클래스
        print("\(progrmaming.name)'s designer: \(progrmaming.designer)")
    }
    if let languages = language as? Language { //옵셔널 바인딩을 통해 리턴 받은 옵셔널 값을 값으로 변환
        print("\(languages.name)'s writing system: \(languages.writingSystem)")
    }
}
/* 출력결과
 Korean's writing system: Hangul
 English's writing system: Latin script
 Python's designer: Guido van Rossum
 Swfit's designer: Chris Lattner
 */

let onlyProgrammingArray = [
    Programming(name: "Python", designer: "Guido van Rossum"),
    Programming(name: "Swfit", designer: "Chris Lattner")
]
print(type(of: onlyProgrammingArray)) //Array<Programming>. 모든 배열 값의 클래스가 Programming인 경우엔 해당 배열의 타입도 [Programming]이므로 다운캐스팅 불필요함.
for language in onlyProgrammingArray{
    print("\(language.name)'s designer: \(language.designer)")
    //Python's designer: Guido van Rossum \n Swfit's designer: Chris Lattner
}
