Collections that can only contain a certain type
================================================

Generic lists
-------------
*   To create a list that will only take strings:

        List<String> strings = new ArrayList<String>()

    *   or alternatively....

        List<String> strings = new ArrayList<>()      // << define any new collections this way

*   Can now add items to it like this:

        strings.add("a String");

*   Can retrieve items from it like this:

        String aString = strings.get(0);

Generic Maps (aka hashmaps)
---------------------------
*   Create a generified map:

        Map<Integer, String> set = new HashMap<Integer, String>;

*   Add item to a generified map:

        Integer key1   = new Integer(123);
        String  value1 = "value 1";
        map.put(key1, value1);

    *   or add item to a generified map like this:

        map.put(123, "value 1");

*   Get item from generified map:

        String value1_1 = map.get(key1);

*   Iterating a map:

        Iterator<Integer> keyIterator   = map.keySet().iterator(); // create iterator

        // iterate, grabbing 1 item at at time until you've passed thru all of them
        while(keyIterator.hasNext()) {
          Integer aKey   = keyIterator.next();
          String  aValue = map.get(aKey);
        }

*   Using a for loop on a map:

        for(Integer aKey : map.keySet()) {
            String aValue = map.get(aKey);
            System.out.println("" + aKey + ":" + aValue);
        }


The unknown wildcard
--------------------
*   list typed to an unknown type: List<?> 
*   only allows items to come out as type Object, although they can be converted after that via casting
*   example use:
        public void processElements(List<?> elements){
           for(Object o : elements){
              System.out.println(o);
           }
        }
    
        *   kind of like a super-verbose Ruby each block

*   MORE: http://tutorials.jenkov.com/java-generics/wildcards.html


Generic classes
---------------
*   http://tutorials.jenkov.com/java-generics/classes.html
