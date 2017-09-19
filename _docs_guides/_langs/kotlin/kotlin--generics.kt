/****************************************** DEFINITIONS *******************************************/
// Producers: objects you only read from
// Consumers: objects you only write to
// contravariance: ????? [TODO look up contravariance & write a definition]
// covariance: ????? [TODO look up covariance & write a definition]

/*********************** GENERICS - DECLARATION-SITE VARIANCE :: in AND out ***********************/
// OPERATOR: in
// ============
// Use 'in' before a generic parameter if the generic type is only consumed but never outputted.
// This permits T supertypes in output params, but restricts us to T & T subtypes in input params.
// Example:
abstract class Comparable<in T> {
    abstract fun compareTo(other: T): Int
}

// Things like this are then allowed:
fun demo(x: Comparable<Number>) {
    x.compareTo(1.0)
    // 1.0 is a subtype of Number (Double), so we can assign x to a var of type Comparable<Double>
    val y: Comparable<Double> = x // OK!
    //val z: Comparable<Any> = x // < This would not be OK [NOTE: CONFIRM THIS]
}


// OPERATOR: out
// =============
// Use 'out' before a generic parameter if the generic type is only outputted but never consumed.
// This permits T supertypes in input params, but restricts us to T & T subtypes in output params.
// Example:
abstract class Source<out T> {
    abstract fun nextT(): T
}

// Things like this are then allowed:
fun demo(strs: Source<String>) {
    val objects: Source<Any> = strs // OK because T is an out-param (otherwise it wouldn't be)
}

/************************************ GENERICS - UPPER BOUNDS *************************************/
// Permit only subtypes of the declared upper bound of a generic.
// Sefault upper bound (if none specified) is Any?

// General Syntax
// --------------
//      <T : UpperBound>
//      <T : UpperBoundUsingTAsGeneric<T>>

// Example
// -------
fun <T : Comparable<T>> sort(list: List<T>) {
    // Do things!
}

// Allowed (since Int is a subtype of Comparable<Int>)
sort(listOf(1, 2, 3))

// Not allowed (since HashMap<Int, String> is not a subtype of Comparable<HashMap<Int, String>>):
sort(listOf(HashMap<Int, String>()))

// Multiple upper bounds: where-clauses
// ====================================
// If the same type parameter needs more than one upper bound, we need a separate where-clause
// Example:
fun <T> cloneWhenGreater(list: List<T>, threshold: T): List<T>
    where T : Comparable,
          T : Cloneable {
  return list.filter { it > threshold }.map { it.clone() }
}
