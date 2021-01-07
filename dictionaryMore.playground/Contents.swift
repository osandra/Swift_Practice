//Dictionary: 순서 없음
var words = ["coffee": "커피", "water": "물", "kimchi": "김치"]
for word in words { //scope 안에서 리턴 사용 시 에러 발생
    print(word)
}
/* 실행할 때마다 출력 순서는 달라짐. 딕셔너리는 순서 없으니까
 (key: "water", value: "물")
 (key: "coffee", value: "커피")
 (key: "kimchi", value: "김치")
 */

//forEach: 클로저를 통해 호출. break과 continue 사용 불가. return을 사용할 때, 해당 호출을 한 scope에서만 종료되고, 그 외부 scope에서는 스킵되지 않음.
words.forEach { word in
    print(word) //위와 같은 형태의 결과 출력
}
let sortedArray = words.keys.sorted()
print(sortedArray) //정렬했기에 항상 ["coffee", "kimchi", "water"] 출력
sortedArray.forEach { word  in
    if word == "coffee" {
        return //해당 구문만 종료되고 이후 print(word)에서 kimchi, water 출력
    }
    print(word)
}

for (key, value) in words {
    print(key, value)
}
/*
 kimchi 김치
 water 물
 coffee 커피
 */

//key, value에 접근
for key in words.keys { //words.values > 값만
    print(key)
}
/*
 kimchi
 water
 coffee
 */

// 항목 삭제
words.removeValue(forKey: "coffee")
print(words) //["water": "물", "kimchi": "김치"]
words["water"] = nil
print(words) //["kimchi": "김치"]

// 항목 업데이트
words.updateValue("배추김치", forKey: "kimchi") //key값이 kimchi인 원소의 value를 배추김치로 변경
print(words) //["kimchi": "배추김치"]
words["kimchi"] = "갓김치"
print(words) //["kimchi": "갓김치"]

//정렬 sorted
words = ["coffee": "커피", "water": "물", "kimchi": "김치"]
var ordered = words.keys.sorted() //key값으로 오름차순 정렬
print(ordered) //["coffee", "kimchi", "water"]
ordered = words.keys.sorted(by: >) //key값으로 내림차순 정렬
print(ordered) //["water", "kimchi", "coffee"]

ordered = words.values.sorted() //value 값으로 오름차순 정렬
print(ordered) //["김치", "물", "커피"]

var order2 = words.sorted(by: >) //key 값을 중심으로 정렬
print(order2) //[(key: "water", value: "물"), (key: "kimchi", value: "김치"), (key: "coffee", value: "커피")]

// key와 value로 Array 생성
// 딕셔너리.keys로 변수를 선언하면 해당 변수의 타입은 Keys가 된다. 만약 키 값(Key)들로 이루어진 배열을 생성하고 싶다면 다르게 정의해야 함.
var englishKeys = words.keys
print(englishKeys) //["coffee", "water", "kimchi"]
print(type(of: englishKeys)) //Keys

var englishKeysArray = [String](words.keys) //딕셔너의 key값들로 이루어진 String형 배열 선언
print(englishKeysArray) //["water", "coffee", "kimchi"]
print(type(of: englishKeysArray)) //Array<String>

var scores = ["john": 43, "kate": 59, "eric": 62]
var onlyScores = [Int](scores.values) //딕셔너의 value값들로 이루어진 String형 배열 선언
print(onlyScores) //[59, 62, 43]
print(type(of: onlyScores)) //Array<Int>

//map, filter, reduce
let mapDicVal = scores.map({$0.value*2 })
print(mapDicVal) //[118, 124, 86]

let filterDicVal = scores.filter{$0.value > 50} //value값이 50 이상인 것만 리턴
print(filterDicVal)  //["eric": 62, "kate": 59]

let test = ["mid": 90, "final": 80]
let sumValues = test.values.reduce(0) {$0+$1}
print(sumValues) //170

let values = scores.keys.reduce("") {$0+$1}
print(values) //johnerickate >> 실행 때마다 값이 달라짐. 딕셔너리는 순서가 없으니까
