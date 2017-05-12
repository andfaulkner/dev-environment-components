// All projects must execute from package main
package main

/*************************************** IMPORTING MODULES ****************************************/
import (
    "fmt"
    "time"
    "math/rand"
)


/************************************** DECLARING FUNCTIONS ***************************************/
// "main" function is where the program executes from
func main() {
    fmt.Println("Welcome to go!")
    helloBasic()
    sayHello("Meeka", "PeekaFaulkner")
    showCurrentTime()
    printRandomNumber()
    fmt.Println(add(42, 13))
}

// Declare your own functions as follows:
func helloBasic() {
    fmt.Println("Hello")
}

// Using arguments in a function:
func sayHello(firstName string, lastName string) {
    fmt.Println("Hello ", firstName, " ", lastName)
}

// Returning a value: use return keyword; put return type after method arguments
func add(x int, y int) int {
    return x + y
}

// Note that functions are hoisted, just like in JS
func printRandomNumber() {
    fmt.Println("A random number:", rand.Intn(10))
}


/***************************************** DATE AND TIME ******************************************/
/**
 * time.Now() outputs the current date and time, in the following format:
 *     2017-05-12 04:07:14.775688257 -0400 EDT
 */
func showCurrentTime() {
    fmt.Println("The time is", time.Now())
}

