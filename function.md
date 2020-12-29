## **Fuction**
----
input parameters 작성 시 parameter 타입도 함께 설정해야 한다. <br> 리턴 값이 있을 경우, 리턴 값의 타입도 설정해야 한다.

```swift
//파라미터 name의 타입은 String, age 타입은 Int, 리턴 값 타입은 String
func message(name: String, age: Int) -> String {
    return("\(name) is \(age) years old")
}
let person1 = message(name: "maro", age: 64) // 파라미터 타입과 매칭되는 arguments 를 넣어야 함
let person2 = message(name: "windy", age: 38)
print(person1) //maro is 64 years old
print(person2) //windy is 38 years old
```

반환(return) 값 없으면 리턴 값 타입 생략 가능. <br >
파라미터가 없는 함수의 경우, **호출할 때마다 항상 같은 값을 출력 및 반환한다.**
```swift
func sayHello(){
    print("hi")
}
sayHello() //hi
```

#### 파라미터엔 <strong>함수 내부에서 사용하는 내부 매개변수(parameter name), 함수 호출 시 사용하는 외부 매개변수(argument label)</strong>가 존재한다. 외부 매개변수를 생략하거나 _ 로 대체하기도 함
 <br>

1. 파라미터에 외부 매개변수, 내부 매개변수가 모두 존재하는 경우 → 호출 시 외부 매개변수 사용 <br > 
```swift
// 외부매개변수: firstEle,secondEle 내부매개변수: x,y
func add(firstEle x: Int, secondEle y: Int) -> Int {
    return x+y
}
print(add(firstEle: 20, secondEle: 40))
```
2. 파라미터에서 외부 매개변수를 생략하는 경우  → 호출 시 내부 매개변수 사용
```swift
func add2(x: Int, y: Int) -> Int {
    return x+y
}
print(add2(x: 20, y: 40))
```
3. 외부 매개변수를 _로 대체하는 경우 → 호출 시 매개변수 이름 생략 가능
```swift
func add3(_ x: Int, _ y: Int) -> Int {
    return x+y
}
print(add3(_: 20, _: 40)) //60
print(add3(20, 40)) // 매개변수 이름 생략 OK
```

- 디폴트 파라미터 값 지정 가능 
```swift
// ex. y파라미터 값 입력 안 할 경우, y값은 15
func multiply(_ x: Int, lastEle y: Int = 15) -> Int {
    return x*y
}
print(multiply(30)) //lastEle에 값 전달 안하면 default로 설정한 값 사용.
```

- 함수에서 여러 값을 한 번에 리턴하고 싶다면 튜플 이용하기
```swift
func cal(_ x: Int, lastEle y: Int) -> (plus: Int, minus: Int, mutiply: Int, division: Double, rest: Int) {
    let plus = x + y
    let minus = x - y
    let multiply = x * y
    let division = ((Double(x) / Double(y))*1000).rounded()/1000 //소수점 세 자리수까지
    let rest = x % y
    return (plus, minus, multiply, division, rest)
}
let returnTuple = cal(12,lastEle: 7)
print(returnTuple) //(plus: 19, minus: 5, mutiply: 84, division: 1.714, rest: 5)
print(returnTuple.division) //리턴 타입에 지정한 이름으로 값에 접근
```
- 튜플도 optional 사용이 가능함. 
```swift
func averageLength (array: [Int]) -> (average: Float, length: Int)? {
    var total = 0
    let length = array.count
    for element in array[0..<array.count]{
        total += element
    }
    let average = Float(total) / Float(length)
    return (average,length)
}
var example1 = averageLength(array: [2,4,6]) //(average 4, length 3)
var example2 = averageLength(array: []) // (average nan, length 0)

//example1의 tuple 값을 얻을려면 Optional Binding을 사용해 unwrap 하기
if let exampleTuple = example1 {
    print(exampleTuple.average) //4.0
    print(exampleTuple.length) //3
}
```

- Variadic Parameters : 개수에 상관없이 여러 매개변수를 받기
```swift 
func square(x numbers: Int...){
    for number in numbers{
        print("The square of \(number) is \(number * number)")
    }
}
square(x: 4,5)
/*
 The square of 4 is 16
 The square of 5 is 25
 */
func addAll(numbers: Int...){
    var total: Int = 0
    for number in numbers{
        total += number
    }
    print(total)
}
addAll(numbers: 10,20,10) //40
addAll(numbers: 1,1,1,1,1,1,1) //7
```

- in-out parameter <br>
스위프트 파라미터 값은 대체로 상수이며, 함수 내에서 파라미터 값 자체를 변경하려고 시도하면 컴파일 타임 에러 발생한다. <br >inout을 이용하면 파라미터 값을 함수 안에서 변경하고 해당 변경사항을 유지할 수 있다.
```swift
var myValue = 10 //변수
func doubleValue (value: inout Int) -> Int {
    value *= 2 //modified by function
    return value
}
print(myValue) //10
// inout 사용된 함수에선 &뒤에 변수를 넘겨줘야 함.
// print(doubleValue(value: &8))-> 에러 발생
// let으로 정의된 상수 넘기면 에러 발생(함수에서 값이 바뀔 것이기에)
print(doubleValue(value : &myValue)) //20
print(myValue) //replace orginal value


//inout 파라미터 사용안하고 변경을 시도하면 에러 발생
func changePara (value: Int) -> Int{
    //value *= 2 // Left side of mutating operator isn't mutable
    let newValue = value * 2 // 이건 파라미터 값 변경이 아닌 새 상수 선언
    return newValue
}
print(changePara(value: 10)) //20
```

- Function Type. 모든 함수는 파라미터 타입과 리턴 타입으로 구성된 함수 타입을 가진다.
```swift
func double (_ x: Float) -> Float{
    return x * 2
}
let doubleFn = double // 변수에 함수를 저장할 수 있다.
print(type(of: doubleFn)) //(Float) -> Float

func gradeEvaluation (lectureCount x: Int, attendance y: Int) -> String {
    let totalEval = x*y
    if totalEval > 50 {
        return "A"
    } else if totalEval >= 30 && totalEval < 50 {
        return "B"
    } else {
        return "C"
    }
}
let evalFn = gradeEvaluation
print(type(of: evalFn)) //(Int, Int) -> String
```

- 함수의 매개변수 및 리턴 값으로 함수(function type) 전달이 가능하다. <br>
함수를 매개변수로 전달할 경우 해당 변수에 함수 타입을 작성하면 되고, 리턴 값에 사용할 경우 리턴 값에 함수 타입을 적어주면 된다.
```swift
func printFnResult (_ evalFunc: (Int, Int)-> String, firstVal: Int, lastVal: Int) {
    let result = evalFunc(firstVal,lastVal)
    print("Result = \(result)")
}
//evaluFunc 매개변수에 함수 타입이 (Int, Int) -> String 인 함수 사용 가능
printFnResult(gradeEvaluation, firstVal: 6, lastVal: 10) //Result = A

//리턴 값으로 함수 사용
func plusPoint (point: Int) -> Int {
    return point + 1
}
func minusPoint (point: Int) -> Int {
    return point - 1
}
func returnFn (checkDone: Bool) -> (Int) -> Int {
    return checkDone ? plusPoint : minusPoint
    //plusPoint, minusPoint 함수 모두 타입이 (Int) -> Int 임
}
var effort = 7
let pointProgess = returnFn (checkDone: effort > 6 )
print(pointProgess(effort)) //8
```