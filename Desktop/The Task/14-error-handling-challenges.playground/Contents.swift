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
 ## Error Handling
 ### Challenge 1
 Write a throwing function that converts a `String` to a number.
 */

enum NumberError: Error {
  case notANumber
}
let stringA = "1999h"
func getNumber(string:String) throws -> Int
{
    guard let resultOfNum = Int(string) else {
        throw NumberError.notANumber
    }
    return resultOfNum
    
}
do {
    let stringB = try getNumber(string: stringA)
    print(stringB)
}catch NumberError.notANumber{
    print("error to convert to INT ", "\(stringA)")
}
// your code here

/*:
 ### Challenge 2
 Write a throwing function that divides two given numbers.
 */
enum DivisionError: Error {
  case divisionByZero(String)
}

func divide( x: Int, by y: Int) throws -> Int {
    guard y != 0 else {
        throw DivisionError.divisionByZero("It is Imposible divice by 0")
    }
    return x / y
}
print(try divide(x: -9, by: 0))

// your code here

/*:
 ### Challenge 3
 Write a throwing function that divides two given numbers passed as `String`. Handle different kinds of error from previous challenges
 */
// your code here
enum requirements: Error {
    case errorNumber,
    divisionByZero
}
func getNumbers(stringA:String , stringB:String) throws -> (Int,Int)
{
    
    guard let resultOfNumA = Int(stringA)  else  {
        throw requirements.errorNumber
    }
    guard let resultOfNumB = Int(stringB) else  {
        throw requirements.errorNumber
    }
    
    return (resultOfNumA,resultOfNumB)
    
    
}
let Astring = "10"
let Bstring = "5"

do {
    let results = try getNumbers(stringA: Astring, stringB: Bstring)
    print(results.0 / results.1)
  
}catch requirements.errorNumber{
    print("error to convert to INT ")
}

