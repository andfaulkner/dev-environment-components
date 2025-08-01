Zustand
=======

## Importing store

Import from a store like this:

```ts
const cardBrands = useCreditCardFormStore(store => store.cardBrands);
const cardBrand = useCreditCardFormStore(store => store.cardBrand);
const setCardBrand = useCreditCardFormStore(store => store.setCardBrand);
```

DO NOT import like this:

```ts
const { cardBrands, cardBrand, setCardBrand } = useCreditCardFormStore(
  store => ({
    cardBrands: store.cardBrands,
    cardBrand: store.cardBrand,
    setCardBrand: store.setCardBrand,
  }),
);
```

It results in stack overflow errors.
