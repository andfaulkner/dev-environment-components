/**************************************************************************************************/
/****************** INCREMENTORS: ORDER OF VALUE AND OPERATOR : ++VAL VS. VAL++ *******************/
/**************************************************************************************************/
//*   ++val   : increment the value of the variable, THEN use it in the current
//              statement / expression.

//*   val++   : use the variable in the current statement / expression, THEN increment the value
//              of the variable


/******************************************** EXAMPLE *********************************************/
// Starting with the following:
    let myArray = ['a', 'b', 'c', 'd', 'e', 'f'];
    let idx = 1;

// If we use val++ in the next step:
    myArray[idx++]
    // => 'b'
    myArray[idx]
    // => 'c'

// ...whereas if we had instead used ++val:
    myArray[++idx]
    // => 'c'
    myArray[idx]
    // => 'c'
