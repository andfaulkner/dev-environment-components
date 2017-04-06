JSX --> Regular syntax
======================
These 2 examples are identical:

    selectCell =
      <MultiSelectableCell
          Checkbox={Checkbox}
          className={theme.selectable}
          onSelect={onSelect}
          selected={selected}
      />;

...and:

    selectCell =
        MultiSelectableCell({
            Checkbox: Checkbox,
            className: theme.selectable,
            onSelect: onSelect,
            selected: selected
        });


Each JSX element is just syntactic sugar for calling:

    `React.createElement(component, props, ...children);`