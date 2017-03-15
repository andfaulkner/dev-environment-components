Working example of keyof and Lookup Types
-----------------------------------------
    export const GenericVaccineTableModel = {
        id:                  { type: Number,   title: "ID"                  },
        conceptId:           { type: String,   title: "Name"                },
        preferredTerms:      { type: String,   title: "Preferred Terms"     },
        displayTerms:        { type: String,   title: "Display Terms"       },
        abbreviations:       { type: String,   title: "Abbreviations"       },
        color:               { type: String,   title: "Color"               },
    };


    type VaccineData = {
        [K in keyof typeof GenericVaccineTableModel]: typeof GenericVaccineTableModel[K];
    }

If I don't want the types of the associated values (in this case, all {}s), I could do something like:

    type VaccineData = {
        [K in keyof typeof GenericVaccineTableModel]: number | string | boolean;
    }

*   This would allow me to associate my own types with the keys.

*   type VaccineData identifies an object that shares the same keys as VaccineData, and:
    *   in example 2, has values that are either of type number, string, or boolean.
    *   in example 1, has value types at each key that match the value type associated with the corresponding key in GenericVaccineTableModel.

