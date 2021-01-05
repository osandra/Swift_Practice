//Optional Chaninig
/*
 옵셔널 변수에 값이 있을 경우 해당 값을 얻기 위해 대표적으로 강제 언래핑 방법과 옵셔널 바인딩 방법을 사용한다. 그러나 만약 옵셔널 값들이 연속적으로 발생할 경우, 해당 값을 옵셔널 바인딩을 통해 얻으려면 if 문을 중첩해서 사용해야 한다(다소 복잡). 강제 언래핑 방법의 경우, 중간에 하나라도 nil값이 있으면 런타임 에러를 발생시킨다. 이에 대함 대안으로 옵셔널 체이닝 방법을 사용할 수 있다.
 옵셔널 체이닝 방법의 경우, 중간에 옵셔널 변수 하나라도 nil 값이 있으면 에러를 발생시키지 않고 nil 값을 반환한다. 모든 값이 있을 경우엔 옵셔널 값을 반환하므로, 마지막에 강제 언래핑 혹은 옵셔널 바인딩을 사용해 값을 얻어야 한다. 옵셔널 체이닝 방법은 옵셔널 값들이 한 단계 보다 깊이 발생해야 사용이 가능하다.
 옵셔널 체이닝 형태: 옵셔녈 형의 프로퍼티나 메서드 호출 바로 뒤에 ?를 사용
 */

class Person {
    var age : Int?
    var name : String?
    var addr : Address? //옵셔널타입
}
class Address {
    var city = "Seoul"
    var detachedHouse: Bool?
}
let john = Person()
print(john.addr) //nil
print(john.addr?.city) //옵셔널 체이닝 방법 사용 > nil 반환
// print(john.addr!.city) -> 강제 언래핑 방법 사용 시 error 발생. john 인스턴스에 addr 값이 없는데 강제 언래핑 하려고 하니까 crash 발생.
if let cityName = john.addr?.city {
    //옵셔널 바인딩을 통한 옵셔널 체이닝 반환 값 변환 > john.addr?.city 값이 nil이므로 The city could not be found 출력
    print(cityName)
}
else {
    print("The city could not be found")
}

let lisa = Person()
lisa.addr = Address()
print(lisa.addr) //Optional(__lldb_expr_40.Address) > 즉 addr값 존재
print(lisa.addr?.city) //옵셔널 체이닝 방법 사용 > Optional("Seoul") 옵셔널 값을 반환
print((lisa.addr?.city)!) //강제 언래핑을 통한 옵셔널 체이닝 반환 값 변환 > Seoul
if let cityName = lisa.addr?.city {
    print(cityName) //옵셔널 바인딩을 통한 옵셔널 체이닝 반환 값 변환 > Seoul 출력
}
else {
    print("The city could not be found")
}

let addrEx = Address()
addrEx.detachedHouse = true
let joy = Person()
joy.addr = addrEx
if let addr = joy.addr { //옵셔널 체이닝을 사용하지 않고 옵셔널 바인딩으로만 값을 얻으려면 if 함수 중첩 사용해야 함
    if let detached = addr.detachedHouse {
        print("Living in a detached house: \(detached)")
    }
    else {
        print("Not living in a detached house")
    }
}
else{
    print("don't have address values")
}
//Living in a detached house: true 출력
//lisa.addr로 실행할 경우 -> Not living in a detached house (detachedHouse 값이 없으니까)
//john.addr로 실행할 경우 -> don't have address values (addr값이 없으니까)

//옵셔널 체이닝 방법으로 detachedHouse값 얻기
print(joy.addr?.detachedHouse)// Optional(true)
print((joy.addr?.detachedHouse)!) //true 출력. 강제 언래핑 사용
if let detached = joy.addr?.detachedHouse { //옵셔널 바인딩 사용
    print("Living in a detached house: \(detached)")
}
else {
    print("Not living in a detached house")
}
//Living in a detached house: true

//Error Handling
//throw error: 예상치 못한 상황이 발생하거나 정상적인 실행 흐름을 지속할 수 없는 경우 이를 알려주기 위해 에러를 던짐. throws 키워드가 있는 함수는 사용할 때 에러 핸들링 해야 함.
//관련된 에러 같이 정의 가능
enum ErrorExample : Error {
    case tooSmall
    case tooBig
}

func throwErrors(_ num: Int) throws -> Int { //함수에 throws 키워드 있을 경우, 에러 핸들링 해야 함.
    guard num >= 1 else {
        //num이 1보다 작으면 tooSmall 에러 던짐
        throw ErrorExample.tooSmall
    }
    guard num <= 100 else {
        //num이 100보다 크면 tooBig 에러 던짐
        throw ErrorExample.tooBig
    }
    return num
}
//throw 키워드 있을 경우, 에러 핸들링 해야 함. do try catch를 이용한 방법
do {
    try throwErrors(300)
    print("succes")
}
catch ErrorExample.tooSmall {
    print("숫자가 1보다 작습니다. 1이상 100이하의 숫자를 입력해주십시오.")
}
catch ErrorExample.tooBig {
    print("숫자가 100보다 큽니다. 1이상 100이하의 숫자를 입력해주십시오.")
}
//숫자가 100 보다 큽니다. 1 이상 100 이하의 숫자를 입력해주십시오.

do {
    let getNumber = try throwErrors(10)
    print(getNumber) //10
}
catch let error {
    print(error) //인자에 100초과 숫자가 들어가면 tooBig 출력, 1미만 숫자 들어가면 tooSmall 출력
}
