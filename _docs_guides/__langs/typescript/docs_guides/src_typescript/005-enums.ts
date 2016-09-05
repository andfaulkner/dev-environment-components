console.log('----------------------------------------------------------------------------------');
//#################################
//#          BASIC ENUMS          #
//#################################
console.log('***************** BASIC ENUMS *****************');

console.log(' ----- Provides a specifically restricted set of options for a value -----');

enum Suit {
  Hearts,
  Spades,
  Clubs,
  Diamonds
}

console.log(' ----- Note that a number cannot be used as the name of a value in an enum -----');
enum FaceValue {
  Ace,
  Two,
  Three,
  Four,
  Five,
  Six,
  Seven,
  Eight,
  Nine,
  Ten,
  Jack,
  Queen,
  King
}

console.log(' ----- Enums can be inspected (via console.log). E.g.: -----');
console.log(Suit);

console.log(' ----- Enums can be used as a type -----');
function grabCard(suit: Suit, faceValue: FaceValue): string {
  return `You were dealt the ${FaceValue[faceValue]} of ${Suit[suit]}!`;
}

console.log(grabCard(Suit.Spades, FaceValue.King));

console.log(' ----- Each enum val has an associated #. The # rets the val, & vice versa -----');
console.log('Suit[\'Hearts\']:            ', Suit['Hearts']);
console.log('Suit.Hearts:               ',   Suit.Hearts);
console.log('Suit[Suit.Hearts]:         ',   Suit[Suit.Hearts]);
console.log('Suit[Suit[\'Hearts\']]:      ', Suit[Suit['Hearts']]);
console.log('Suit[0]:                   ',   Suit[0]);
console.log('Suit[\'0\']:                 ', Suit['0']);
console.log('Suit[Suit[0]]:             ',   Suit[Suit[0]]);
console.log('Suit[Suit[Suit[0]]]:       ',   Suit[Suit[Suit[0]]]);


console.log('----------------------------------------------------------------------------------');
//###################################################################
//#          EXPLICITLY DEFINE NUMBERS LINKED TO ENUM VALS          #
//###################################################################
console.log('***************** EXPLICITLY DEFINE NUMBERS LINKED TO ENUM VALS *****************');

console.log(" ----- Can set # tied to val w '=':  e.g. ValName = 5, Val2Name = 7, etc. e.g. -----");

console.log(' ----- Explicitly set #s for enum vals: Example 1: -----');

enum CardFaceValue {
  Two = 2,
  Three = 3,
  Four = 4,
  Five = 5,
  Six = 6,
  Seven = 7,
  Eight = 8,
  Nine = 9,
  Ten = 10,
  Jack = 11,
  Queen = 12,
  King = 13,
  Ace = 14
}

console.log(CardFaceValue);

console.log(' ----- Explicitly set #s for enum vals: Example 2: -----');

enum UnitsOfInfo {
  Byte = 8,
  Kilobyte = 8192,
  Megabyte = 65536,
  Gigabyte = 524288,
  Terabyte = 4194304,
  Petabyte = 33554432
}

console.log(UnitsOfInfo);

console.log('----------------------------------------------------------------------------------');
//#####################################################################
//#          DYNAMICALLY SETTING NUMBERS TIED TO ENUM VALUES          #
//#####################################################################
console.log('***************** DYNAMICALLY SETTING NUMBERS TIED TO ENUM VALUES *****************');

console.log(' ----- Numbers tied to enum vals can be computed & set dynamically. e.g. -----');

enum FileAccess {
    // constant members
    None,
    Read    = 1 << 1,
    Write   = 1 << 2,
    ReadWrite  = Read | Write,
    // computed member
    G = '123'.length
}
console.log(FileAccess);
console.log('FileAccess[0]: ', FileAccess[0]);


console.log('----------------------------------------------------------------------------------');
//###################################
//#          AMBIENT ENUMS          #
//###################################
console.log('***************** AMBIENT ENUMS *****************');

// NB diff between ambient & non-ambient enums:
//   In regular enums:            any member w/ no initializer is considered a 'constant' member
//   In non-const ambient enums:  any member w/ no initializer is considered a 'computed' member
