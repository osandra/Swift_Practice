//Generic
//하나의 함수가 특정 타입에서만 사용가능한 경우엔 다른 타입에서 해당 함수의 기능을 사용하고 싶은 때 함수 안의 코드를 다른 함수에서 반복 작성해야 한다는 단점이 있음. 해당 단점을 해결해주는 Generic.
var stringArray1 = [String]() //빈 배열 선언방법1
var stringArray2 = Array<String>() //빈 배열 선언방법2
//<>: Generic 스위프트에서 배열은 제너릭 타입이라서 배열에 Int, String, Double등 다양한 타입을 선언할 수 있음.
var stringArray3 = Array<Int>()

//Generic Functions
func onlyInt(_ a: inout Int, _ b: inout Int){
    let temp = a
    a = b
    b = temp
}
var int1 = 3
var int2 = 10
onlyInt(&int1, &int2)
print(int1,int2) // 10 3
//해당 함수는 파라미터로 Int형만 받아야 한다는 단점이 있음. 만약 Double형, String형의 값을 바꾸고 싶다면 파라미터만 바꿔서 같은 내용의 코드를 반복 작성해야한다는 단점 있음.

//Generic 함수에서 타입형(Int,String) 대신 placeholder 타입 이름(아래 예시: T)을 넣어, 함수를 호출할 때 파라미터 T 자리에 원하는 타입으로 호출할 수 있음. 함수 이름 뒤에서 꺾쇠 괄호 안에 매개변수 이름을 T를 넣어주면(<T>), 해당 타입 파라미터를 통해 T가 placeholder인 것 인식.
func genericSwitch<T>(_ a: inout T, _ b: inout T){
    let temp = a
    a = b
    b = temp
}
var string1 = "good"
var string2 = "morning"
genericSwitch(&string1, &string2)//두 파라미터 타입이 동일하기만 한다면 모든 어떤 타입이든 인자로 전달 가능
print(string1, string2) //morning good
var double1 = 30.6
var double2 = 304.1
genericSwitch(&double1, &double2)
print(double1, double2) //304.1 30.6

//stack(Last in First Out) 형태 또한 제너릭 타입으로 작성하면 여러 타입의 값으로 구현 가능
struct allStack<Element> {
    var array = [Element]()
    //구조체에서 저장 프로퍼티 값 변경하기 위해 mutating 키워드 사용
    mutating func push(_ item: Element){
        array.append(item) //맨 마지막에 값 추가
    }
    mutating func pop(){
        array.removeLast() //맨 마지막에 있는 값 제거
    }
}
var stringStack = allStack<String>()
stringStack.push("good")
print(stringStack.array) //["good"]
stringStack.push("evening") //["good", "evening"]
stringStack.pop() //["good"]
var intStack = allStack<Int>()
intStack.push(3) //[3]
intStack.push(4) //[3,4]
intStack.pop() //[3]

// 맨 위에 위치한 배열 항목을 반환하는 기능을 추가하기
extension allStack {
    var topItem : Element? { //비어있으면 nil값을 반환해야 하므로 옵셔널 계산 프로퍼티 형태로 선언
        //프로퍼티 topItem 의 타입은 Element(구조체에서 정의한 타입 파라미터 이름 사용)
        if array.isEmpty { //비어있으면 true
            return nil
        }
        return array.last //마지막에 위치한 항목 리턴
    }
}
if let topElement = intStack.topItem{ //옵셔널 바인딩
    print(topElement) //3
}
//타입 제한: 가끔은 제너릭 함수와 제너릭 타입에 사용되는 모든 타입 중 특정 타입을 제한하는 게 유용함. 예로, 딕셔너리의 키는 변동하면 안 되므로 hashable해야 함. 타입 제한은 타입 파라미터 뒤에 단일 클래스 혹은 프로토콜을 :(콜론)으로 구분하여 적으면 된다. <T: 프로토콜 이름> -> 프로토콜을 만족하는 타입 T로 제한
