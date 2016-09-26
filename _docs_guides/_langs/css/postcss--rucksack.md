
Position shorthand syntax
=========================
*   position: [type] [all];
*   position: [type] [y] [x];
*   position: [type] [top] [x] [bottom];
*   position: [type] [top] [right] [bottom] [left];

// http://simplaio.github.io/rucksack/docs/#quantity-pseudo

Hex RGCA shortcuts
==================
  .foo {
    color: rgba(#fff, 0.8);
  }

  =>

  .foo {
    color: rgba(255,255,255, 0.8);
  }

Transitions
===========
.foo {
  transition: all 250ms ease-in-cubic;
}

