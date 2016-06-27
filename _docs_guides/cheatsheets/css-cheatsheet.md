#border
border-[bottom|top|left|right]width:	[medium|thin|thick|length|**px]
border-[bottom|top|left|right]style:	[solid|inset|outset|none|hidden|dotted|dashed|double|ridge]
border-[bottom|top|left|right]color:	[['red'|'blue'|...] | #**|rgb(*,*,*) | transparent]

## select all elements that are descendants of another element. Can be nested.
parent child grandchild ... bottomChild { }


## select all elements that are _immediate_ descendents of another element. Can be nested.
parent > child > grandchild > ... > bottomChild { }

## select all elements that are adjacent siblings of another element. Goes top-to-bottom
div + p {	... }
    *   Matches any <p> tag whose PRECEDING sibling is a <div> tag. Selects:
    		p in 			<div></div><p>SELECTED!</p> 		
            but not p in	<p></p><div>NOT_SELECTED</div>

## select all elements that are siblings (adjacent or not) declared below another element
div ~ a ~ p { ... }					
		*   selects p in		    <div></div><a ...>link</a><p>SELECTED!</p> 
		    ...but not in	    	<div></div> <p>NOT_SELECTED</p> <a ...>link</a>


