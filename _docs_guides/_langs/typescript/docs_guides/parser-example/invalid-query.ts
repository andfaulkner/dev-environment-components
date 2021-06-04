/**
 * Help text to display when invalid queries are given.
 */
export const invalidQueryText = (query: string): string => `
---------------------------------------------------------------------------------------------------
[ERROR] Invalid query provided: ${query ? query : '[[undefined]]'}

    Queries should be in one of these general formats:

        SELECT * FROM DataModel

        SELECT * FROM DataModel WHERE dataProp = 'data value'

        SELECT * FROM DataModel WHERE dataProp = 'data value' AND dataProp2 = 'data value'

        SELECT * FROM DataModel WHERE dataProp = 'data value' AND NOT dataProp2 = 'data value'

        SELECT * FROM DataModel WHERE   dataProp = 'data value'
                                AND     dataProp2 = 'data value'
                                AND NOT dataProp3 = 'data value'

    ...where:
        DataModel:
            The data model corresponding to the data type (e.g. City, District, Store, Toy)
            'data value': search dataProp of all DataModel instances for this value

        dataProp = 'data value':
            Return only objects where dataProp is equal to 'data value'.

    Example
        For data:
            { Toy { store: 'walmart', id: '1' }}
            { Toy { store: 'toybarn', id: '2' }}
            { Toy { store: 'walmart', id: '3' }}
        Return data for query "SELECT * FROM Toy WHERE store = 'on'":
            { Toy { store: 'walmart', id: '1' }}
            { Toy { store: 'walmart', id: '3' }}
        Return data for query "SELECT * FROM Toy WHERE store = 'on' AND NOT id = '1'":
            { Toy { store: 'walmart', id: '3' }}
---------------------------------------------------------------------------------------------------
`;


export const throwSelectErrorText =
    `SELECT statement must be in the form: SELECT * FROM __DataType__`;

export const throwSelectRequiredErrorText =
    `Queries must begin with "SELECT * FROM __DataClass__"`;

export const throwWhereErrorText =
    `WHERE clause must be in the form: __dataProp__ = '__data value__'`;

