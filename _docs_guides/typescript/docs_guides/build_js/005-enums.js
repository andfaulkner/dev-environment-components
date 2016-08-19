console.log('----------------------------------------------------------------------------------');
//#################################
//#          BASIC ENUMS          #
//#################################
console.log('***************** BASIC ENUMS *****************');
console.log(' ----- Provides a specifically restricted set of options for a value -----');
var Suit;
(function (Suit) {
    Suit[Suit["Hearts"] = 0] = "Hearts";
    Suit[Suit["Spades"] = 1] = "Spades";
    Suit[Suit["Clubs"] = 2] = "Clubs";
    Suit[Suit["Diamonds"] = 3] = "Diamonds";
})(Suit || (Suit = {}));
console.log(' ----- Note that a number cannot be used as the name of a value in an enum -----');
var FaceValue;
(function (FaceValue) {
    FaceValue[FaceValue["Ace"] = 0] = "Ace";
    FaceValue[FaceValue["Two"] = 1] = "Two";
    FaceValue[FaceValue["Three"] = 2] = "Three";
    FaceValue[FaceValue["Four"] = 3] = "Four";
    FaceValue[FaceValue["Five"] = 4] = "Five";
    FaceValue[FaceValue["Six"] = 5] = "Six";
    FaceValue[FaceValue["Seven"] = 6] = "Seven";
    FaceValue[FaceValue["Eight"] = 7] = "Eight";
    FaceValue[FaceValue["Nine"] = 8] = "Nine";
    FaceValue[FaceValue["Ten"] = 9] = "Ten";
    FaceValue[FaceValue["Jack"] = 10] = "Jack";
    FaceValue[FaceValue["Queen"] = 11] = "Queen";
    FaceValue[FaceValue["King"] = 12] = "King";
})(FaceValue || (FaceValue = {}));
console.log(' ----- Enums can be inspected (via console.log). E.g.: -----');
console.log(Suit);
console.log(' ----- Enums can be used as a type -----');
function grabCard(suit, faceValue) {
    return `You were dealt the ${FaceValue[faceValue]} of ${Suit[suit]}!`;
}
console.log(grabCard(Suit.Spades, FaceValue.King));
console.log(' ----- Each enum val has an associated #. The # rets the val, & vice versa -----');
console.log('Suit[\'Hearts\']:            ', Suit['Hearts']);
console.log('Suit.Hearts:               ', Suit.Hearts);
console.log('Suit[Suit.Hearts]:         ', Suit[Suit.Hearts]);
console.log('Suit[Suit[\'Hearts\']]:      ', Suit[Suit['Hearts']]);
console.log('Suit[0]:                   ', Suit[0]);
console.log('Suit[\'0\']:                 ', Suit['0']);
console.log('Suit[Suit[0]]:             ', Suit[Suit[0]]);
console.log('Suit[Suit[Suit[0]]]:       ', Suit[Suit[Suit[0]]]);
console.log('----------------------------------------------------------------------------------');
//###################################################################
//#          EXPLICITLY DEFINE NUMBERS LINKED TO ENUM VALS          #
//###################################################################
console.log('***************** EXPLICITLY DEFINE NUMBERS LINKED TO ENUM VALS *****************');
console.log(" ----- Can set # tied to val w '=':  e.g. ValName = 5, Val2Name = 7, etc. e.g. -----");
console.log(' ----- Explicitly set #s for enum vals: Example 1: -----');
var CardFaceValue;
(function (CardFaceValue) {
    CardFaceValue[CardFaceValue["Two"] = 2] = "Two";
    CardFaceValue[CardFaceValue["Three"] = 3] = "Three";
    CardFaceValue[CardFaceValue["Four"] = 4] = "Four";
    CardFaceValue[CardFaceValue["Five"] = 5] = "Five";
    CardFaceValue[CardFaceValue["Six"] = 6] = "Six";
    CardFaceValue[CardFaceValue["Seven"] = 7] = "Seven";
    CardFaceValue[CardFaceValue["Eight"] = 8] = "Eight";
    CardFaceValue[CardFaceValue["Nine"] = 9] = "Nine";
    CardFaceValue[CardFaceValue["Ten"] = 10] = "Ten";
    CardFaceValue[CardFaceValue["Jack"] = 11] = "Jack";
    CardFaceValue[CardFaceValue["Queen"] = 12] = "Queen";
    CardFaceValue[CardFaceValue["King"] = 13] = "King";
    CardFaceValue[CardFaceValue["Ace"] = 14] = "Ace";
})(CardFaceValue || (CardFaceValue = {}));
console.log(CardFaceValue);
console.log(' ----- Explicitly set #s for enum vals: Example 2: -----');
var UnitsOfInfo;
(function (UnitsOfInfo) {
    UnitsOfInfo[UnitsOfInfo["Byte"] = 8] = "Byte";
    UnitsOfInfo[UnitsOfInfo["Kilobyte"] = 8192] = "Kilobyte";
    UnitsOfInfo[UnitsOfInfo["Megabyte"] = 65536] = "Megabyte";
    UnitsOfInfo[UnitsOfInfo["Gigabyte"] = 524288] = "Gigabyte";
    UnitsOfInfo[UnitsOfInfo["Terabyte"] = 4194304] = "Terabyte";
    UnitsOfInfo[UnitsOfInfo["Petabyte"] = 33554432] = "Petabyte";
})(UnitsOfInfo || (UnitsOfInfo = {}));
console.log(UnitsOfInfo);
console.log('----------------------------------------------------------------------------------');
//#####################################################################
//#          DYNAMICALLY SETTING NUMBERS TIED TO ENUM VALUES          #
//#####################################################################
console.log('***************** DYNAMICALLY SETTING NUMBERS TIED TO ENUM VALUES *****************');
console.log(' ----- Numbers tied to enum vals can be computed & set dynamically. e.g. -----');
var FileAccess;
(function (FileAccess) {
    // constant members
    FileAccess[FileAccess["None"] = 0] = "None";
    FileAccess[FileAccess["Read"] = 2] = "Read";
    FileAccess[FileAccess["Write"] = 4] = "Write";
    FileAccess[FileAccess["ReadWrite"] = 6] = "ReadWrite";
    // computed member
    FileAccess[FileAccess["G"] = '123'.length] = "G";
})(FileAccess || (FileAccess = {}));
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
