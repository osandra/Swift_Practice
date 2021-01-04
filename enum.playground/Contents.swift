// Enumeration: 열거형
// 관련 있는 값들로 구성되어 있는 그룹
/*
 enum 이름 {
  //정의 부분
 }
 */
enum Compass1 {
    //여러 케이스를 한 줄로 선언 (콤마로 구분)
    case North, South, East, West
}

enum Compass2 {
    case North //enumeration case
    case South
    case East
    case West
}

var example : Compass2 //Compass2형 인스턴스인 example
example = .East //위에서 Compass 타입으로 선언되었으니, Compass 값 변경할 때 타입을 생략하고 .으로 변경 가능
print(example) //East
print(Compass2.North) //North
var example2 = Compass2.West
print(example2) //West
print(type(of: example2)) //Compass2

//switch 구문에서 개별 열거형 값 매칭
switch example { //Compass2형 인스턴스인 example
//Compass2에 있는 모든 케이스(North,South,East,West)와 매칭되어야 함. 하나라도 생략되면 컴파일 에러 발생. 모든 열거형 케이스 매칭하기 어려우면 default case로 커버 가능
case .North:
    print("북")
case .South:
    print("남")
case .East:
    print("동")
case .West:
    print("서")
}
//열거형 케이스를 반복하고 싶다면 뒤에 :CaseIterable 사용
enum Compass3:CaseIterable {
    case North
    case South
    case East
    case West
}
print(Compass3.allCases.count) //4 allCase안에 열거형 케이스들이 들어있음.
for compass in Compass3.allCases {
    print(compass) //North\n South\n East\n West
}

enum Week{
    case Mon,Tue,Wed,Thur,Fri,Sat,Sun
    //함수문 안에서 switch구문 실행
    func printWeekSwitch(){
        switch self {
        case .Mon, .Tue, .Wed, .Thur, .Fri:
            print("주중")
        case .Sat, .Sun:
            print ("주말")
        }
    }
    func printWeekIf(){
        //위에서 작성한 switch 문을 if 문으로 작성한다면
        if(self == .Mon || self == .Tue || self == .Wed || self == .Thur || self == .Fri){
            print("주중입니다")
        }
        else if (self == .Sat || self == .Sun){
            print("주말입니다")
        }
        
    }
}
var sunday = Week.Sun
sunday.printWeekSwitch() //주말
sunday.printWeekIf() //주말입니다

//연관값을 갖는 Enum
enum Date {
    //Date라는 열거형 타입은, (Int, Int, Int)형의 연관값을 가지는 .intDate 값을 갖거나, String 타입의 연관값을 가지는 .stringDate 값을 갖는다.
    case intDate(Int, Int, Int)
    case stringDate(String)
}
var todayDate = Date.intDate(2021, 1, 4)
todayDate = Date.stringDate("2021년 1월 4일")
//즉 todayDate라는 변수는 .intDate 혹은 .stringDate의 값을 저장할 수 있음. 그러나 한번에 하나의 값만 저장.
switch todayDate {
case .intDate(let year, let month, let day):
    print("\(year)년 \(month)월 \(day)일")
case let .stringDate(date): //해당 케이스의 모든 연관 값이 let 혹은 var이 사용되었다면 이를 case 이름 앞으로 위치시킬 수 있음
    print(date)
}

// Raw Values
// 열거형의 타입이 정의된다면 raw values를 미리 가질 수 있다.
enum Meal:String{ //String타입으로 지정
    case breakfast // 값 지정되지 않으면 case 이름 할당
    case lunch = "김치볶음밥"
    case dinner
}
print(Meal.breakfast) //breakfast
print(Meal.breakfast.rawValue) //breakfast
print(Meal.lunch) //lunch
print(Meal.lunch.rawValue) //김치볶음밥

//Int타입일 경우, 각 케이스는 이전 케이스보다 1값 높은 raw value가진다.
enum ComputerBrand:Int{
    case SAMSUNG, LG, APPLE, LENOVO=4 , DELL
}
print(ComputerBrand.SAMSUNG) //SAMSUNG
print(ComputerBrand.LG) //LG
print(ComputerBrand.SAMSUNG.rawValue) //0
print(ComputerBrand.LG.rawValue) //1
print(ComputerBrand.LENOVO.rawValue) //4
print(ComputerBrand.DELL.rawValue) //5

// 옵셔녈도 연관값을 갖는 열거형으로 선언되어 있음.
// @frozen public enum Optional<Wrapped> : ExpressibleByNilLiteral{
//    case none
//    case some(Wrapped)
//}
var a: Int? =  20 //Optional(20)
var b: Int? = Optional.some(10) //Optional(10)
var c: Int? = Optional.none //var c: Int? = nil과 동일
var d: Optional<Int> = 30 //Optional(30)
print(a,b,c,d) //Optional(20) Optional(10) nil Optional(30)

//옵셔널형은 case .none, .some 가지고 잇음
var component: String? = "CPU"
switch component {
case .none:
    print("부품이 없습니다")
case .some(let x) where x == "램":
    print("램이 있습니다")
case .some(let x) where x == "CPU":
    print("CPU가 있습니다")
default:
    print("다시 입력해 주십시오")
}
//CPU가 있습니다
