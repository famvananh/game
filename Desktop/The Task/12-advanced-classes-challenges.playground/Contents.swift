/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.



/*:
 ## Advanced Classes
 ### Challenge 1
 Create three simple classes called `A`, `B`, and `C` where `C` inherits from `B` and `B` inherits from `A`. In each class initializer, call `print("I'm <X>!")` both before and after `super.init()`. Create an instance of `C` called `c`.  What order do you see each `print()` called in?

 ### Challenge 2
  Implement `deinit` for each class. Place your `c` inside of a `do { }` scope which will cause the reference count to go to zero when it exits the scope. What order are the classes deinitialized in?
 */

// your code here for both Challenage 1 and Challenge 2
class A
{
    var text :String
   public init(text:String) {
        self.text = text
        print("\(text) is initialized")
        }
    deinit {
      print("\(text) is deinitialized")
    }
    var fullInfo: String{
         
        return self.text
    }
    func getSomething(){
        print(text)
    }
   
}
var printText = A(text: "I am A!")
printText.getSomething()


class B:A
{
     var group: [A] = []
    override func getSomething(){
           print(text)
       }
}
let printTextB = B(text: "I am B!")
printTextB.getSomething()

class C:A
{
    var textC:String
    override init(text: String) {
        self.textC = "C!"
        super.init(text: text)
    }
    init(text: String , textC:String) {
        self.textC = textC
        super.init(text: text)
    }
    
     deinit {
         print("\(text) is deinitialized")
       }
    override var fullInfo: String{
         
        return super.fullInfo + " - \(self.textC)"
    }
  weak var b:A?
   
    
}
do {
    let b = B(text: "I am B!")
    let c1 = C(text: "I am C-1!")
    c1.b = b
    let c2 = C(text: "I am C-2!")
    c2.b = b
    b.group = [c1,c2]
}

var c:C = C(text: "I am")
print(c.fullInfo )






// your code here


