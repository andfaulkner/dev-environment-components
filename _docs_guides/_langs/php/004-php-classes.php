<?php
    /****** CREATING NAMESPACES ******/
    // This will cover the entire file
    namespace Organisms;

    /****** CREATING CLASSES ******/
    /**
     * Create animal
     */
    class Animal
    {
        /*** Default instance variables ***/
        var $name;
        var $age;
        var $animal_type;

        /*** Default instance variable with default value ***/
        var $is_human = "False";

        /*** Create method ***/
        function am_i_old() {
            return $this->name . (($this->age > 10) ? " is old" : " is not old");
        }

        /*** Create constructor ***/
        /**
         * Create animal object
         *
         * @param string $name        Name of animation (e.g. Meeka)
         * @param number $age         Numeric age of animal (integer)
         * @param string $animal_type Type of animal (e.g. Bear)
         */
        function __construct($name, $age, $animal_type)
        {
            $this->name = $name;
            $this->age = $age;
            $this->animal_type = $animal_type;
        }
    }

    // Display class data
    echo "Name of class (including namespace): ";
    echo Animal::class . "\n";

    /****** INSTANTIATING OBJECTS FROM CLASSES ******/
    // Instantiate class
    $animal = new Animal("Meeka", 7, "Dog");

    // Display entire instantiated object
    print_r($animal);
    // => Animal Object ( [name] => Meeka [age] => 7 [animal_type] => Dog )

    print_r("\n");

    // Display single property from object
    print_r($animal->name);
    // => "Meeka"

    print_r("\n");

    // Run method on object
    print_r($animal->am_i_old());
?>
