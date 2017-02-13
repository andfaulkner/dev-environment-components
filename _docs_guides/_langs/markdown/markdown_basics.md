=============================================================
====================== MARKDOWN BASICS ======================
=============================================================

-------------------------------------------------------------------------------

Headers
=======

Header level 1
==============

Header level 2
--------------

OR

# Header level 1
## Header level 2
### Header level 3
###### Header level 6

-------------------------------------------------------------------------------

Blockquotes
===========

> This is a blockquote with 2 paragraphs. This is the 1st paragraph. Both
> paragraphs are in the same block. This 2nd line is still in the 1st paragraph.
>
> This is the 2nd paragraph. It is within in the same block as the first
> paragraph, but separated by a space when rendered.


Nested Blockquotes
------------------

> This is a blockquote with a nested blockquote inside it.
>
> > This is the nested blockquote - within the 1st blockquote
>
> This line is back to the 1st 'level' of the blockquote.

-------------------------------------------------------------------------------

Lists
=====

Unordered lists
---------------

Three equivalent methods to define unordered (bulleted) lists:

*   Red
*   Green
*   Blue

-   Red
-   Green
-   Blue

+   Red
+   Green
+   Blue

Ordered lists
-------------
2 equivalent methods:

1.  First point
2.  Second point
3.  Third point

...and confusingly...

1.  First point
1.  Second point
1.  Third point

...because the given #s don't affect the generated HTML, which turns the whole
list into an <ol> block with each individual item being a <li> tag.

To prevent a line starting w/ a # then dot from becoming an ordered list, escape the dot. E.g.:

5423\. Next sentence begins.


Lists with paragraphs
-----------------------------
Note that the 4 spaces is key.

Ordered:

1.  This is an ordered list item with two paragraphs. Lorem ipsum dolor
    sit amet, consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.

    Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.
    Donec sit amet nisl. Aliquam semper ipsum sit amet velit.

2.  Suspendisse id sem consectetuer libero luctus adipiscing.


Unordered:

*   This is an unordered list item with two paragraphs.

    This is the second paragraph in the list item. You're
only required to indent the first line. Lorem ipsum dolor
sit amet, consectetuer adipiscing elit.

*   Another item in the same list.

-------------------------------------------------------------------------------

Code
====

Code blocks
-----------
This is a normal paragraph.

    This is a code block.

This is another normal paragraph:

    This is another code block.

Inline code
-----------
*   Put backticks around the in-sentence code e.g. Use the `printf()` function.

*   Use double backticks if the code has backticks e.g. ``A literal backtick(`) here``

Code blocks with syntax highlighting
------------------------------------
Inline syntax highlighting for commonly used languages:

```css
#button { border: none }
```

```tsx
<input value={password} type="password" name="password" onChange={changePassword}/>
```

```js
const hello = (name) => `Hello ${name}!`;
```

```html
<div class="my-text-block-holder">A bunch of text here</div>
```

```ruby
def hello(name)
    puts "hello #{name}!"
end
```

```sh
hello() {
    name="$1"
    echo "hello $name!"
}
```

```sql
CREATE TABLE table_name (
    column_1 data_type,
    column_2 data_type,
    column_3 data_type
);
```


-------------------------------------------------------------------------------

Horizontal rules/spacing lines
==============================

***

---

****************

---------------

- - -

- - - - - - - - - - -

* * *

* * * * * * * * * * * * * *

-------------------------------------------------------------------------------

Links
=====

Inline links
------------

This is [an example](http://example.com/) inline link.

Example inline link referring to a [local resource](/local-resoruce/) via relative path


Reference-style links
---------------------

This is [an example][id] reference-style link. [Here is a 2nd][heis2] reference-style link

[id]:    http://example.com/
[heis2]: http://anothersite.com/


Implicit-style link to [Google][] - no id tag required

[google]: http://www.google.com


Automatic links
---------------

<http://example.com/>

Generates a link for you, with http://example.com/ as the displayed text

-------------------------------------------------------------------------------

Emphasis
========

*single asterisks - same as <em> tags*
_single underscores - also same as <em> tags_

**double asterisks - same as <strong> tags**
__double underscores - also same as <strong> tags__

These can be *inline* or even in-word - i.e. __start__ing or end*ing* mid-word


Escape characters
-----------------
\*    produces a literal asterisk
\_    produces a literal underscore
\\    backslash
\`    backtick
\{\}  curly braces
\[\]  square brackets
\(\)  parentheses
\#    hash mark
\+    plus sign
\-    minus sign (hyphen)
\.    dot
\!    exclamation mark

-------------------------------------------------------------------------------

Images
======

![Alt text](/path/to/img.jpg)


![Alt text][id]
[id]: url/to/image  "Optional title attribute"


-------------------------------------------------------------------------------

Main soource: https://daringfireball.net/projects/markdown/syntax#overview