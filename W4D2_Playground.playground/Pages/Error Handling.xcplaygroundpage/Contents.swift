//: [Previous](@previous)
import Foundation
/*:
 ## Do Try Catch
 We are going to learn about error handling which is how to handle a potential operation failure gracefully. When the operation does fail, it is useful to understand what caused the failure. In terms of user experience, it is a much better to have our application display proper errors or do an alternative action as oppose to crashing our app.
 */
/*:
 Error handling has a few components to it and we will run through all of them with our example below.
 */
/*:
 Here we are defining our own 'Error' enum. 'Error' is a protocol part of the Apple framework. This is to indiciate a potential reason for an error to occur
 */
enum DivideError: Error {
  case CannotDivideByZero
}

/*:
 This is a function that divides numbers num1 and num2. Notice the `throws` keyword in the function. It means this function is capable of 'raising' or 'throwing' an error
 */
func divideNumbers( num1: Double, num2: Double ) throws -> Double{
  
  // We can to catch the error if we are dividing by zero, because this is bad!
  if num2 == 0 {
    
    // If the num2 parameter is in fact zero, let's indicate an error as occured by 'throwing' it out
    throw DivideError.CannotDivideByZero
  }
  
  // Otherwise, we can just do the basic division here
  return num1 / num2
}


/*:
 Now let's try our function and cause an error to be thrown. We start by wrapping the function inside a do/catch block.
 */
do{
  
  // We call our 'divideNumbers' function with the keyword 'try' in front
  let dividedAnswer = try divideNumbers(num1: 10, num2: 0)
  print("My divided answer result: \(dividedAnswer)")
  
  // The 'divideNumbers' will throw an error because we are trying to divide by zero
}
  // And here is where we 'catch' the error
catch let error {
  
  // Once 'caught', we can print out the error for more information and prevents our app from crashing
  print("An error is thrown: \(error)")
}


/*:
 - Experiment:
 Create a Human class that has a name and age property. Also, create an initializer for this class to set its initial properties.
 */
class Human {
    var name:String
    var age:Int
    init(name:String, age:Int) throws {
        self.name = name
        self.age = age
        
        if name == "Jonny" {
            throw NameError.weirdName
        }
    }
    enum NameError:Error {
        case weirdName
    }

    
    
    
}


do {
    let jonny = try Human(name: "Jonny", age: 23)
}
catch let error {
    print("An error occured \(error)")
}











/*:
 - Experiment:
 Create your own errors that throw when the name provided is empty or if the age is invalid. Go back and update the Human's initializer to throw an error when the data passed in is invalid.
 */


/*:
 - Experiment:
 Now you can test your new Human class and surround it around the do-catch blocks.
 */


/*:
 - Experiment:
 Test your Human class again but don't surround it with a do-catch block and use `try?` instead. What do you notice? (What is the value of the new human when an error is thrown?)
 */


/*:
 - Experiment:
 Given the following JSON data, try to parse the JSON using `JSONSerialization`, then print out each key-value.
 
 `class func jsonObject(with data: Data, options opt: JSONSerialization.ReadingOptions = []) throws -> Any`
 */
let data = "{\"firstName\": \"Bob\", \"lastName\": \"Doe\", \"vehicles\": [\"car\", \"motorcycle\", \"train\"]}".data(using: .utf8)!
do {
    let jsonDataUnformatted = try? JSONSerialization.jsonObject(with: data, options: [])
    if let jsonData = jsonDataUnformatted as? Dictionary<String, String> {
        print(jsonData["firstName"])

    }
    
    
    
    
}catch let error {
    print("\(error)")
}










/*:
 - Callout(Challenge):
 Going back to our challenge from "More Optionals", let's rewrite the form valiation but we will use throw errors to indicate which piece is missing. We want to write a function that validates form data filled in by a user. Once we encounter the first field that is blank, we want to throw an error indicating which field is empty. Otherwise, print out all the information.
 */
// Should pass all checks and print all information
//let username: String? = "user1"
//let password: String? = "password123"
//let email: String? = "user1@lighthouselabs.ca"

// Should stop at password check and throw an error regarding empty password
let username: String? = "user1"
let password: String? = nil
let email: String? = "user1@lighthouselabs.ca"

// Should stop at username check and throw an error regarding empty user name
//let username: String? = nil
//let password: String? = nil
//let email: String? = "user1@lighthouselabs.ca"

enum FieldError:Error {
    case noEmail
    case noUserName
    case noPassword
}

func checkInfo() throws {
    
    if username == nil {
        throw FieldError.noUserName
        
    }
    if password == nil {
        throw FieldError.noPassword
        print("no password")
    }
    if email == nil {
        throw FieldError.noEmail
    }
    
}
do {
    try checkInfo()
}
catch let error {
    print(error)
}

/*:
 - Callout(Challenge):
 Given the following HondaDealership class, finish it off by implementing a function and testing it. Write a function that sells off a chosen car for the price.
 
 `func sellCar(model: String, offeredPrice: Int) throws`
 
 Throw an error if the model doesn't exist, insufficient amount of money was given, or the car is out of stock.
 */
class HondaDealership{
  
    enum CarErrors:Error {
        case nonExistentModel
        case insuficientMoney
        case outOfStock
    }
    
    
  var availableCarSupply = ["Civic" : (price: 5000, count: 5),
                            "CRV" : (price: 7000, count: 9),
                            "Prelude" : (price: 9000, count: 2),
                            "Jaguar" : (price: 9000, count: 0)]
  
    func sellCar(model: String, offeredPrice: Int) throws {
    
        if let enteredModel = availableCarSupply[model] {
            if offeredPrice < enteredModel.price {
                throw CarErrors.insuficientMoney
            }//offeredPrice
            if enteredModel.count < 1 {
                throw CarErrors.outOfStock
            }
            
            
            
        } else {
            throw CarErrors.nonExistentModel
        }
        
    }//sellCar
  
}//Honda

var newDealership = HondaDealership()
do {
try newDealership.sellCar(model: "Jaguar", offeredPrice: 20000)
} catch let error {
    print(error)
}

































//: [Next](@next)
