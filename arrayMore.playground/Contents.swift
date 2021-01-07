//Array
var array = ["*", "**", "***"]
//배열을 문자열로 -> join함수 사용
let join = array.joined() //"******"
let separateExample = array.joined(separator: "\n")
print(separateExample)
/*
     *
     **
     ***
 */

//문자열을 배열로 : split함수 사용
let toArray = separateExample.split(separator: "\n")
print(toArray) //["*", "**", "***"]
let reversed = toArray.reversed() //컬렉션 요소를 역순으로 표시하는 보기를 반환. 즉 새로운 공간을 할당하지 않고 해당 요소에 역순으로 접근가능하게 함.
print(reversed) //ReversedCollection<Array<Substring>>(_base: ["*", "**", "***"])
print(type(of: reversed)) //ReversedCollection<Array<Substring>>

//같은 타입의 역버전 값을 가져오고 싶으면, 해당 타입 이니셜라이져를 통해 새로운 객체로 초기화
let reversed1 = Array(reversed)
print(reversed1) //["***", "**", "*"]

//.map(fuction)을 통해 새 배열 리턴하는 방법
let reversed2 = toArray.reversed().map({$0})
print(reversed2) //["***", "**", "*"]

let greeting = "hello"
print(String(greeting.reversed())) //olleh

let join2 = reversed.joined(separator: "\n") //reversed1.joined, reversed2.joined도 같은 결과 반환
print(join2)
/*
     ***
     **
     *
 */

//원소 개수 : count
print(array.count) //3

//동일한 원소 여러 개 한번에 추가
var sevenZero = [Int](repeating: 0, count: 7) //[0, 0, 0, 0, 0, 0, 0]
//substring 사용해서 원소 선언
var oneToTen = [Int](1...10) //[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 빈 배열 인지 확인
print(oneToTen.isEmpty) //false

// 원소의 첫 번째 항목 및 마지막 항목 접근 ->  .first , .last
print(oneToTen.first) //Optional(1). Array의 first 라는 계산 프로퍼티는 빈 배열일 경우엔 첫번째 원소를 리턴하지 못할 수 있기 때문에 옵셔널로 정의되어있다.
if let firstElement = oneToTen.first {
    print(firstElement) //1
}

for e in oneToTen {
    print(e) // 모든 원소 출력(1부터 10까지)
}
for i in 0...oneToTen.count-1{
    print(oneToTen[i]) //위와 동일한 결과 출력 0번째 원소인 1부터 마지막 원소인 10까지 출력
}
for e in oneToTen[0...3]{ //0번 위치한 원소인 1부터 3번 원소인 4까지
    print(e)
}
for e in oneToTen[0..<3]{ //0번 위치한 원소인 1부터 3번 원소 미만까지(1~3)
    print(e)
}

let score = [10,20,40,20,39,40]
print(score.firstIndex(of: 20)) //처음으로 해당 값 20이 등장하는 인덱스 리턴 -> Optional(1)

//min, max
print(score.min()) //Optional(10)
print(score.max()) //Optional(40)

//최소값과 최대값 리턴 혹은 출력하는 함수 예

//방법1: 옵셔널 튜플 타입으로 리턴해서, 받은 값을 옵셔널 바인딩을 통해 언래핑 하기
//min()리턴값이 옵셔널 이므로, 튜플로 두 개의 값을 리턴하려면 튜플 타입 (Int?, Int?) 라고 설정해야 함.
func minmax(array: Array<Int>) -> (Int?, Int?) {
    let minScore = array.min()
    let maxScore = array.max()
    return (minScore, maxScore) // 옵셔널 값 리턴
}
print(minmax(array: score)) //(Optional(10), Optional(40))
var min, max: Int? // 옵셔널 Int형이 변수 min, max 선언
(min,max) = minmax(array: score) //옵셔널 타입으로 값을 받아서 옵셔널 바인딩을 통해 언래핑하기
if let minValue = min, let maxValue = max {
    print("min: \(minValue), max: \(maxValue)") //min: 10, max: 40
}

//방법2: 함수에서 리턴 값 없이 값만 출력하기. 함수 안에서 옵셔널 바인딩 사용.
func minmax2(array: Array<Int>) {
    let minScore = array.min()
    let maxScore = array.max()
    if let min = minScore, let max = maxScore {
        print("min: \(min), max: \(max)")
    }
}
minmax2(array: score) //min: 10, max: 40

//방법3: 함수 안에서 강제 언래핑으로 값 리턴하기(빈 배열이 들어오면 error발생)
func minmax3(array: Array<Int>) -> (Int, Int) {
    if array.isEmpty {
        return (0,0) // 빈 배열 시 (0,0)을 반환하는 if문 코드 작성하면 에러는 발생하지 않음.
    }
    let minScore = array.min()
    let maxScore = array.max()
    return (minScore!, maxScore!) //강제 언래핑
}
print(minmax3(array: score)) //(10, 40)
print(minmax3(array: [])) //(0, 0)

// 정렬방법 sort, sorted, reversed
// sort: 리턴 값 없고, 원본 배열 자체를 정렬
// sorted: 원본 배열은 그대로, 정렬된 배열을 리턴
// reverse(): 리턴 값 없고, 원본 배열을 반대로 정렬
var array1 = [1,10,100,29]
var resultSort = array1.sort()
print(resultSort) //() 리턴 값 없음
print(array1) // [1, 10, 29, 100]

array1 = [1,10,100,29,49,7]
var resultSorted = array1.sorted(by: >) // 내림차순 정렬
print(resultSorted) //[100, 49, 29, 10, 7, 1]
print(array1) //[1, 10, 100, 29, 49, 7] (변경 X)

var resultReverse = array1.reverse()
print(array1) //[7, 49, 29, 100, 10, 1] 원본이 반대로 정렬됨.
print(resultReverse) //() 리턴 값 없음

// 고차 함수 map, filter, reduce
// map: 각각의 값을 매개변수를 통해 받은 함수(클로저)에 적용한 후 새로운 배열을 반환
// filter: 각각의 값을 조건에 맞는 새로운 값만 추출하여 반환
// reduce: 내부의 값을 하나로 통합하여 반환

var sorting = array1.map({(val:Int) -> Int in return 2 * val}) //[14, 98, 58, 200, 20, 2]
var sorting2 = array1.map({$0 * 2}) //위와 동일한 식

var filter = array1.filter({(val:Int) -> Bool in return val > 40 }) //[49,100] 40이 넘어야 한다는 조건 결과가 참인 값만 리턴하기
var filter2 = array1.filter({$0 > 40}) //[49, 100] 위와 동일한 식

var oneTo_Ten = [Int](1...10)
var sum = oneTo_Ten.reduce(0, {(val1: Int, val2: Int)-> Int in return val1 + val2}) //55
var sum2 = oneTo_Ten.reduce(0, {$0 + $1}) //배열.reduce(초기 값,$0+$1) 위 식과 동일
var sum3 = oneTo_Ten.reduce(0){$0 + $1} // 후행 클로저 사용
var stringList = ["You","For","Today"]
var reduceString = stringList.reduce("Thank", {$0 + $1})
print(reduceString) //ThankYouForToday
