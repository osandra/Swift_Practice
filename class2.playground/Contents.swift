import UIKit

//init overloading
class Book { // 다른 클래스를 상속받지 않은 클래스를 base class라고 말함.
    var name: String = "none" //옵셔널타입의 저장 프로퍼티
    var publishedYear: Int = 0000
    var author: String
    var category: String = "none"
    var names: String { //계산 프로퍼티
        return "Book name: \(name), author name: \(author)"
    }
    init(){
        self.author = "none" // 초기값 지정
        //옵셔널타입이 아닌 저장프로퍼티에 디폴트값을 지정하지 않았다면 킁래스 인스턴스 생성시 파라미터로 입력받거나, 초기값 지정해야 함.
        //저장 프로퍼티인 name,publishedYear,category가 옵셔널타입이면서 디폴트 값을 지정해서 포함하지 않아도 OK
    }
    // overloading: 같은 이름의 함수를 여러번 쓸 수 있다.
    init(publishedYear: Int, author: String){ //파라미터로 입력받는 형태
        self.publishedYear  = publishedYear
        self.author = author
    }
    init(year publishYear: Int, author: String, name: String){ //외부매개변수 이름 year 로 지정
        publishedYear  = publishYear //파라미터 이름이랑 프로퍼티 이름이 안 겹칠 때는 self 사용 안 해도 됨.
        self.author = author
        self.name = name
    }
    func wrap(){
        print("need to wrap the book")
    }
}
var book1 = Book() //인스턴스 생성
print("\(book1.name), \(book1.publishedYear), \(book1.author)") //none, 0, none
var book2 = Book(publishedYear: 1919, author: "Somerset")
print("\(book2.name), \(book2.publishedYear), \(book2.author)") //none, 1919, Somerset
var book3 = Book(year: 1919, author: "Somerset", name: "The Moon and Sixpence")
print("\(book3.name), \(book3.publishedYear), \(book3.author)") //The Moon and Sixpence, 1919, Somerset
print(book3.names) //Book name: The Moon and Sixpence, author name: Somerset

/*
 상속 -> 부모의 모든 프로퍼티와 메서드를 상속받음
 class 상속받을클래스이름(subclass) 상속할클래스이름(superclass) {
 
 }
*/
class Essay: Book{
    //새 프로퍼티 추가 가능
    var firstEdtion : Bool  = true
    var present: Bool = false
    //overriding methods(앞에 oveeride 키워드를 작성해줘야, 오버라이딩 하는 것을 인식함. 상속받는 함수에 오버라이딩 하려는 함수가 없으면 에러 발생)
    override func wrap(){
        if present == false{
            print("no wrap")
        } else {
            print("wrap it")
        }
    }
    //override calculated property. read-only computed propery를 read-write 프로퍼티로 오버라이딩 할 순 있지만 read-write 프로퍼티를 read-only 프로퍼티로 오버라이딩 할 순 없다.
    override var names: String {
        get{
            return super.names + ", first edition: \(firstEdtion)"
        }
        set{
            author = newValue
        }
    }
}

var essay1 = Essay()  //init 설정 안 할 경우, 프로퍼티 값은 모두 default 값으로 설정된 인스턴스를 생성함. superclass인 Book의 모든 속성이 디폴트 값이 있어서 가능함.
print(essay1.name) //none
print(essay1.firstEdtion) //true

essay1.name = "the joy of thought"
print(essay1.name) //the joy of thought 상속받은 프로퍼티 값 변경 가능
essay1.wrap() //no wrap

print(essay1.names) //Book name: the joy of thought, author name: none, first edition: true
essay1.names = "Lee" //set value
print(essay1.names) //Book name: the joy of thought, author name: Lee, first edition: true


//저장 프로퍼티의 값을 바꾸려면 init에서 파라미터 해당 값을 입력받아 변경하는 방법이 있음. 클래스에서 저장 프로퍼티를 override var 프로퍼티 이름 = 값 변경하는 것은 가능하지 않음.
class Novel: Book{
    var description: String = "none"
    init(category: String){
        super.init() //초기화 이후 self. 로 상속받은 프로퍼티 접근 가능
        self.category = category //저장프로퍼티의 값 파라미터로 입력 받기
    }
    init(year: Int, description: String, author: String, subname: String){
        self.description = description //새로 생성한 프로퍼티를 먼저 선언하기
        super.init(year: year, author: author, name: subname) //이후 super class에서 상속받는 프로퍼티 초기화
    }
}
var novel1 = Novel(category: "novel")
print("\(novel1.name), \(novel1.publishedYear), \(novel1.author), category: \(novel1.category)") //none, 0, none, category: novel
//override을 막고 싶으면 앞에 final 키워드 붙이기 ex final var, final func, final class

var novel2 = Novel(year: 1999, description: "감정을 느끼지 못하는 한 소년의 이야기", author: "손원평", subname: "아몬드")
print("Book: \(novel2.name), author: \(novel2.author), description: \(novel2.description)") //Book: 아몬드, author: 손원평, description: 감정을 느끼지 못하는 한 소년의 이야기

/*
 구조체는 memberwise initaliazer로 인해, 디폴트 값이 없는 저장 프로퍼티가 있더라도 init 코드를 작성하지 않아도 된다.
 인스턴스를 생성할 때 저장 프로퍼티 이름을 통해 인자로 각 프로퍼티 값을 넘겨줄 수 있다.
 만약 저장 프로퍼티의 디폴트 값이 있는 경우에는 인스턴스 생성시 원하는 프로퍼티에만 값을 넘겨줄 수 있다.
 */
struct Food {
    var name: String
    var ingredient: [String] = ["water"]
    func printAll(){
        print("name: \(name), ingredient: \(ingredient)")
    }
}
var kimchi = Food(name:"kimchi") //프로퍼티 이름을 통해 인자를 넘길 수 있음
var kimchibokkeumbap = Food(name:"kimchi", ingredient: ["kimchi, rice"])
kimchi.printAll() //name: kimchi, ingredient: ["water"]
kimchibokkeumbap.printAll() //name: kimchi, ingredient: ["kimchi, rice"]

//상속 받는 게 없는 base Class
class baseClass {
    var num : Int
    var height: Int
    init(num: Int, height: Int){
        self.num = num
        self.height = height
    }
}

class subClass : baseClass {
    var name : String
    //저장 프로퍼티를 get set있는 계산 프로퍼티로 변경 가능. super.을 사용해서 상속 클래스의 프로퍼티에 접근
    override var height: Int {
        get {
            return super.height + 1 //키에 1을 더한 값 리턴
            }
        set {
            super.height = newValue //새 값 입력받기
        }
    }
    init(num: Int, name: String, height: Int) {
        self.name = name
        super.init(num: num, height: height)
    }
    convenience init(name: String){
        //convenience init을 통해 특정 값만 입력받고, 나머지 값은 원하는 디폴트 값으로 해놓을 수 있음.
        self.init(num: 0, name: name, height: 150) //name만 파라미터로 입력받고, num과 height은 디폴트값 설정
    }
    func double () -> Int {
        //num 값 두 배 만드는 함수
        super.num = num * 2
        return num * 2
    }
}
var alexa = subClass(num: 20, name: "Alexa", height: 129)
print(alexa.height) //130 (1 더한 값 리턴)
alexa.height = 199 //set value
print(alexa.height) //200
print("number is \(alexa.num)") //number is 20
alexa.double()
print("number is \(alexa.num)") //number is 40

var base = baseClass(num: 3, height: 129)
print(base.height) //169

//convenience init
var convenienceEx = subClass(name: "mini")
print(convenienceEx.name) //mini
print(convenienceEx.num) //0

/*
 Deinitializaiton: 구조체가 아닌 클래스에서만 가능하며 클래스 인스턴스의 할당이 해지되기 전에 호출된다.
 deinit {
    // deinit되기 직전에 실행할 코드 deinitializer
 }
 */
