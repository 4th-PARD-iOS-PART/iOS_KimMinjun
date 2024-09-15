import UIKit
import Foundation


// ---------- Mark : if문  ----------------
//문제 1: if 문
//문자열 변수 fruit이 "apple", "banana", "cherry" 중 하나일 때, 해당하는 과일을 출력하세요.
//var fruit = "apple" // 이 값을 "banana"나 "cherry"로 바꿔보세요.

// ---------- Mark : if문 답안 작성란  ----------------
print("// ---------- Mark : if문 답안 작성란  ----------------")
var fruit = "apple"
//fruit = "banana"
//fruit = "cherry"
if fruit == "apple"{
    print(fruit)
} else if fruit == "banana"{
    print(fruit)
}else if fruit == "cherry"{
    print(fruit)
}

// ---------- Mark : guard문  ----------------
//문제 2: guard 문
//함수 printPositiveNumber를 작성하세요. 이 함수는 하나의 정수 인자를 받아, 그 값이 양수일 경우에만 그 값을 출력합니다. 만약 값이 양수가 아니라면, "The number is not positive."를 출력합니다.
//
//func printPositiveNumber(_ number: Int) {
//}
//
//printPositiveNumber(5)  // 5를 출력해야 함
//printPositiveNumber(-3) // "The number is not positive." 출력해야 함


// ---------- Mark : guard문 답안 작성란 ----------------
print("// ---------- Mark : guard문 답안 작성란 ----------------")
func printPositiveNumber(_ number: Int) {
    guard number > 0 else{
        print("The number is not positive.")
        return
    }
    print(number)
}

printPositiveNumber(5)
printPositiveNumber(-3)






// ---------- Mark : enum 연관값  ----------------

//문제 1: 연관값 사용하기
//"책(Book)", "비디오(Video)", "음악(Music)" 등의 미디어 아이템을 나타내는 열거형을 작성하세요. 각 아이템에는 타이틀(title)이라는 연관값을 부여합니다.

// ---------- Mark : enum 연관값 답안 작성란 ----------------

print("// ---------- Mark : enum 연관값 답안 작성란 ----------------")
enum media {
    case book (title: String)
    case video(title: String)
    case music(title: String)

}






// ---------- Mark : enum 원시값 ----------------

//문제 2: 원시값 사용하기
//열거형을 사용해 주중(sunday to saturday)을 나타내세요. 각 요일에는 1부터 7까지의 원시값을 부여합니다.

// ---------- Mark : enum 원시값 답안 작성란 ----------------

print("// ---------- Mark : enum 원시값 답안 작성란 ----------------")
enum day : Int {
    case sun = 1
    case mon = 2
    case tue = 3
    case wed = 4
    case thu = 5
    case fri = 6
    case sat = 7
    
}




// ---------- Mark : function overloading  ----------------

//문제 1: 함수 오버로딩 (Overloading)
//printArea라는 함수를 작성해보세요. 이 함수는 사각형의 가로와 세로 길이를 받아 면적을 출력하고, 또 다른 버전의 함수는 원의 반지름을 받아 면적을 출력합니다.


// ---------- Mark : function overloading 답안 작성란 ----------------
//
print("// ---------- Mark : function overloading 답안 작성란 ----------------")

func printArea(_ width : Int , _ height : Int ){
    let area = width * height
    print("사각형의 면적은 \(area) 입니다.")
    
}

func printArea(_ r : Double){
    let area = r*r*3.14
    print("원의 면적은 \(area)입니다.")
}

printArea(10,10)
printArea(10)






// ---------- Mark : function If문사용 / guard문 사용  ----------------

//문제: 로그인 상태 확인
//함수 checkLoginStatus를 작성해보세요. 이 함수는 로그인 상태를 나타내는 Bool 변수와 사용자 이름을 나타내는 String? 변수를 받습니다. 만약 로그인 상태가 true이면 사용자 이름을 출력하고, false이면 "로그인이 필요합니다."를 출력하세요. 사용자 이름이 nil이라면 "알 수 없는 사용자"를 출력하세요.

// ---------- Mark : function If문사용 답안 작성란  ----------------
print("// ---------- Mark : function If문사용 답안 작성란  ----------------")
func checkLoginStatus (_ check : Bool, _ uname : String?){
    if check {
        if let uname = uname{
            print("사용자 이름 : \(uname)")
        }else{
            print("알 수 없는 사용자")
        }
        
    }else{
        print("로그인이 필요합니다.")
    }
}

checkLoginStatus( true,  "김민준")
checkLoginStatus( true, nil)
checkLoginStatus( false, "유재혁")


// ---------- Mark : function guard문 사용 답안 작성란 ----------------
print("// ---------- Mark : function guard문 사용 답안 작성란 ----------------")
func guardcheckLoginStatus (_ check : Bool, _ uname : String?){
    guard check else{
        print("로그인이 필요합니다.")
        return
    }
    guard let uname = uname else {
        print("알 수 없는 사용자")
        return}
    print("사용자 이름 : \(uname)")
}



guardcheckLoginStatus( true,  "김민준")
guardcheckLoginStatus( true, nil)
guardcheckLoginStatus( false, "유재혁")

// ---------- Mark : Optional Nil-coalescing 사용  ----------------

//문제 1: Nil-coalescing 연산자 ?? 사용하기
//문자열 배열 names에 이름이 몇 개 들어있습니다. 배열의 첫 번째 요소를 출력하세요. 만약 배열이 비어 있다면 "No name found"를 출력하세요.
//var names: [String] = ["Alice", "Bob", "Charlie"]

// ---------- Mark : Optional Nil-coalescing 사용 답안 작성란  ----------------
print("// ---------- Mark : Optional Nil-coalescing 사용 답안 작성란  ----------------")
var names: [String] = ["Alice", "Bob", "Charlie"]
//var names : [String] = []
print(names.first ?? "No name found")


// ---------- Mark : Optional if-let 사용  ----------------

//문제 2: if-let을 사용한 옵셔널 바인딩
//문자열 옵셔널 optionalString에 값이 있을 수도, 없을 수도 있습니다. 값이 있으면 "The string is:"와 함께 값을 출력하세요. 값이 없으면 "The string is nil."을 출력하세요.
//var optionalString: String? = "Hello"


// ---------- Mark : Optional if-let 사용 답안 작성란 ----------------
print("// ---------- Mark : Optional if-let 사용 답안 작성란 ----------------")
var optionalString: String? = "Hello"
//var optionalString : String? = nil


if let opt = optionalString {
    print("The string is : \(opt)")
}else {
    print("The string is nil.")
}




// ---------- Mark : Optional guard-let 사용 답안 작성란  ----------------

print("// ---------- Mark : Optional guard-let 사용 답안 작성란  ----------------")
func forGuardTest (){
//    var optionalString2: String? = "Hello"
    var optionalString2 : String? = nil
    
    
    guard let opt2 = optionalString2 else {
        print("The string is nil.")
        return
    }
    print("The string is : \(opt2)")
}

forGuardTest()




