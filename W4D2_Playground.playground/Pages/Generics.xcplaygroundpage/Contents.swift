//: [Previous](@previous)
/*:
 ## Generics
 Generics allow us to write flexible and reusable code that can take in any variable type. You have been using collections that use generic types. Both arrays and dictionaries use a generic type. You can define any variable type for those collections to store.
 */
/*:
 If we want to write a function that prints two numbers for us, we would have to write a function for each type of number variable.
 */

func printMyTwoNumbersInt(num1: Int, num2: Int){
  
  print("My numbers are \(num1) and \(num2)")
}

func printMyTwoNumbersDouble(num1: Double, num2: Double){
  
  print("My numbers are \(num1) and \(num2)")
}

/*:
 Instead, we can write a function that takes a generic type so we can print any two values
 */
func printMyTwoNumbers<Element>(num1: Element, num2: Element){
  
  print("My numbers are \(num1) and \(num2)")
}

printMyTwoNumbers(num1: 1, num2: 1)
printMyTwoNumbers(num1: 2.0, num2: 2.1)
printMyTwoNumbers(num1: "three", num2: "four")

/*:
 - Experiment:
 Now you try! Write a generic function that takes in two parameters and multiply their value together and print the result. (Hint: You might run into an error after finishing. Continue to the next experiment to find out why!)
 */

func multiplyTwoItems<Element: Numeric>(num1:Element, num2:Element) {
    print("\(num1 * num2)")
}




/*:
 - Experiment:
 You might have run into error in the console regarding the multiplication operator can only be applied to numbered parameters. This makes sense as multiplying two Strings together doesn't make sense. So, we want to only take in variable types that *can* use the multiplication operator. In this case, we can limit the element type to types that conform to the `Numeric` protocol like below.
 */

func multiply<Element: Numeric>(num1: Element, num2: Element) {
  
}


/*:
 - Experiment:
 Update your multiplication function and test it! Try using different variable types to see what works and what doesn't.
 */


/*:
 - Experiment:
 Write a generic function that takes in two parameters. One parameter is an array of elements, and the other is one element you are trying to find in the array. Return the index where the element exists in the array. ie: Given `[1,5,2,4]` and `'5'`, the returned index is `1`
 */

/*:
 - Note:
 For this experiment, refrain from using the array method `indexOf`. Also the protocol `Equatable` might be useful here. Search it up to see what it's about.
 */
var index = 0
func  indexFinder<T:Numeric>(arr:[T], num:T)->(Int) {
    for element in arr {
    
        if element != num {
        index += 1
            
        } else {
            break
        }
       
    }//for

    
    return index
}

indexFinder(arr: [1,2,3,4,5,6,7,8,9], num: 5)



/*:
 - Callout(Challenge):
 During class you saw a simple implementation of a stack where data is inserted (pushed) to the top of the stack when data is added. When data is removed (pop) from the stack, it removes the first item at the top of the stack. We will now implement a similar data structure called a "queue" as a generic.
 */
/*:
 - Note:
 You can think of a queue like a line up at a grocery store. The first person in line finishes their transaction, and then leaves the line up. Any new customers have to start at the back of the line up.
 
 Create a "Queue" data structure with the following functions:
 - enqueue: add an item to the queue
 - dequeue: remove an item from the queue, and return the removed element
 */


class Queue<Element> {
    
    
    
    func enqueue<Element>(givenArray:[Element], person:Element)->([Element]) {
        var myArray = givenArray
        
        myArray.append(person)
        
        return myArray
    }
    
    func dequeue<Element>(givenArray:[Element])->([Element]) {
        var myArray = givenArray
        
        myArray.remove(at: 0)
        
        return myArray
    
    }

}


//var queue:[T:Numeric] = []

//: [Next](@next)

