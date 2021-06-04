/************************************** THIRD-PARTY MODULES ***************************************/
import {
    CharInputStream,
    isWhitespaceChar,
    Char,
    isNode,
} from '../../../../../node_modules/mad-utils/lib/shared';
import {inspect} from 'util';

/**************************************** PROJECT MODULES *****************************************/
import {
    invalidQueryText,
    throwSelectErrorText,
    throwSelectRequiredErrorText,
    throwWhereErrorText,
} from './invalid-query';

/**************************************** TYPE DEFINITIONS ****************************************/
/**
 * Types of tokens the Tokenizer can return.
 * Types and examples of each:
 *     - str:         aoiaw waiej3 a nkw            -- Excludes the quotes
 *     - word:        aonywihjewr                   -- Excludes quotes
 *     - char:        a
 *     - kw:          WHERE, NOT, SELECT, FROM
 *     - eql:         =
 *     - funcname:    Name of a function
 */
type TokenTypes = 'str' | 'word' | 'char' | 'kw' | 'eql' | 'funcname';

/**
 * Identifies a single "piece" of the parsed output
 */
type Token = {type: TokenTypes; value: string};

export type _WhereOps = 'equal' | 'not_equal';
export type _WhereClause = {
    operation: _WhereOps;
    dataProp: string;
    value: string;
    type: '_WhereClause';
};
export type WhereStatement = {type: 'WhereStatement'; children: _WhereClause[]};
export type SelectStatement = {type: 'SelectStatement'; model: string};

/**************************************** TOKENIZER CLASS *****************************************/
/**
 * Operates on a character input stream, and returns a stream object
 * Allows you to iterate through and read a string one token at a time
 * Also does token matching.
 *
 * Tokens:
 *
 * Returns {{Object} { peek:  Show next value without removing it from the stream
 *                     next:  Show the next value and discards it from the stream
 *                     isEOF: Returns true if stream is at end
 *                     throw: Throw input stream errors }}
 */
export class _TokenStream {
    private current: any;

    constructor(public input: CharInputStream) {}

    private read_while = (predicate: (chr: string) => boolean) => {
        let str = '';
        while (!this.input.isEOF() && predicate(this.input.peek())) {
            str += this.input.next();
        }
        return str;
    };

    /**
     * After a string starts, read until the end of the string, accounting for escape chars
     */
    private read_escaped = (end: string): string => {
        let escaped = false;
        let str = '';
        this.input.next();
        // prettier-ignore
        while (!this.input.isEOF()) {
            let ch = this.input.next();
            if      (escaped)     str += ch, escaped = false;
            else if (ch === "\\") escaped = true;
            else if (ch === end)  break;
            else                  str += ch;
        }
        return str;
    };

    private read_string = (): Token => ({type: 'str', value: this.read_escaped("'")});

    /**
     * Read in characters to build a function name (probably)
     */
    private read_function_name = (): Token => {
        let str = '';
        str += this.input.next();
        return {type: 'funcname', value: str + this.read_while(this.isFunctionNameChar)};
    };

    /**
     * Read in the next character and apply it to building a token
     */
    private read_next = (): Token => {
        this.read_while(this.isWhitespace);
        if (this.input.isEOF()) return null;

        const chr = this.input.peek();
        if (chr == "'") return this.read_string();

        if (this.isFunctionNameStartChar(chr)) return this.process_token(this.read_function_name());

        if (!this.isWhitespace(chr))
            return this.process_token({
                type: 'word',
                value: this.read_while(chr => !this.isWhitespace(chr)),
            });

        return this.process_token({type: 'char', value: chr});
    };

    // prettier-ignore
    /**
     * Modify token type based on content
     */
    private process_token(token: Token): Token {
        const { type, value } = token;
        if (type !== 'str' && value  === 'WHERE' ) return {type: "kw",  value: value}
        if (type !== 'str' && value  === '='     ) return {type: "eql", value: value}
        if (type !== 'str' && value  === 'AND'   ) return {type: "kw",  value: value}
        if (type !== 'str' && value  === 'NOT'   ) return {type: "kw",  value: value}
        if (type !== 'str' && value  === 'SELECT'
           || value === '*' || value === 'FROM'  ) return {type: "kw",  value: value}
        return token;
    }

    private isFunctionNameStartChar = (chr: Char): boolean => /^[a-zA-Z$_]$/.test(chr); // prettier-ignore
    private isFunctionNameChar =      (chr: Char): boolean => /^[a-zA-Z0-9_$]$/.test(chr); // prettier-ignore
    private isWhitespace =            (chr: Char): boolean => isWhitespaceChar(chr); // prettier-ignore

    /**
     * Show next token without iterating index up
     */
    public peek = (): Token => this.current || (this.current = this.read_next());

    /**
     * Iterate to next token
     */
    public next = (): Token => {
        let tok = this.current;
        this.current = null;
        return tok || this.read_next();
    };

    /**
     * True if there's no upcoming character (next item is end of file)
     */
    public isEOF = () => this.peek() === null;
}

/********************************************* PARSER *********************************************/
/**
 * Convert stream of tokens into a query AST.
 * Return AST object by running instance.parse()
 *
 * @param {_TokenStream} input - Data stream of syntax tokens
 * @returns {Object { parse: {() => AST}   Parses _TokenStream given the constructor; return an AST
 *                    input: {_TokenStream} Access initial _TokenStream given to the constructor }}
 */
export class _Parser {
    input: _TokenStream;
    pos = 0;

    constructor(input: _TokenStream) {
        this.input = input;
    }

    /**
     * Parse the full query.
     */
    public parse = (): SqlQueryAST => {
        let query = [];
        while (!this.input.isEOF()) {
            query.push(this.parse_section());
        }
        return {type: 'query', query};
    };

    // ******************** PRIVATE ********************
    /**
     * Convenience iterator
     */
    private next_token = (): Token | null => {
        this.pos++;
        return this.input.next();
    };

    //
    // COMPARISON HELPERS
    //

    private is_keyword = (kw: string) => {
        let tok = this.input.peek();
        return tok && tok.type === 'kw' && (!kw || tok.value === kw);
    };

    private is_where =     () => this.is_keyword('WHERE'); // prettier-ignore
    private is_star =      () => this.is_keyword('*'); // prettier-ignore
    private is_select =    () => this.is_keyword('SELECT'); // prettier-ignore
    private is_from =      () => this.is_keyword('FROM'); // prettier-ignore
    private is_and =       () => this.is_keyword('AND'); // prettier-ignore
    private is_not =       () => this.is_keyword('NOT'); // prettier-ignore
    private is_eql =       () => this.input.peek() && this.input.peek().type === 'eql'; // prettier-ignore
    private is_func_name = () => this.input.peek() && this.input.peek().type === 'funcname'; // prettier-ignore

    //
    // ERRORS
    //

    private throw_select_error =          () => {throw new Error(throwSelectErrorText)        } // prettier-ignore
    private throw_select_required_error = () => {throw new Error(throwSelectRequiredErrorText)} // prettier-ignore
    private throw_where_error =           () => {throw new Error(throwWhereErrorText)         } // prettier-ignore

    //
    // CHILD EXPRESSION PARSERS
    //

    /**
     * Get data model type from "SELECT * FROM __DataModelType__" statement
     */
    private parse_model_type = () => {
        if (this.is_select()) {
            if (this.next_token() && !this.is_star()) this.throw_select_error();
            if (this.next_token() && !this.is_from()) this.throw_select_error();
            if (this.next_token() && this.is_func_name())
                return {
                    type: 'SelectStatement',
                    model: this.next_token().value,
                };
            this.throw_select_error();
        }
    };

    /**
     * Handle content of a single "dataType = 'value'" clause within the full WHERE expression
     *     e.g. "region = 'on'"
     */
    private parse_where_clause = (operation: _WhereOps) => {
        let whereClause = {type: '_WhereClause', operation} as _WhereClause;

        if (this.input.peek().type === 'funcname' && this.input.peek().value) {
            whereClause.dataProp = this.next_token().value;
            if (!this.is_eql() || !this.next_token()) this.throw_where_error();

            let dataToken = this.next_token();
            if (dataToken.type !== 'str') this.throw_where_error();

            return Object.assign(whereClause, {value: dataToken.value});
        }
    };

    // Handle full WHERE expression
    //     e.g. "WHERE region = 'on' AND isTravel = 'false' AND NOT id = '63'"
    private parse_where_expression = () => {
        let whereClauses = [];

        if (this.input.peek().type === 'funcname') {
            whereClauses.push(this.parse_where_clause('equal'));
        }

        while (this.is_and() && this.next_token()) {
            if (this.is_not()) {
                this.next_token();
                whereClauses.push(this.parse_where_clause('not_equal'));
            } else {
                whereClauses.push(this.parse_where_clause('equal'));
            }
        }

        return {type: 'WhereStatement', whereClauses};
    };

    // prettier-ignore
    /**
     * Handle a section of the query - either the SELECT statement or the WHERE clause
     */
    private parse_section = () : any => {
        if (this.is_select())                     return this.parse_model_type();
        if (!this.is_select && this.pos === 0)    this.throw_select_required_error();
        if (this.is_where() && this.next_token()) return this.parse_where_expression();
    }
}

/**************************************** BASIC VALIDATION ****************************************/
/**
 * Quick & dirty basic validation of query string (mainly for performance)
 * @param {string} cleanQuery SQL query to do basic validation on
 * @return {void|never} Throws if SQL query is invalid
 */
const validateQueryBasic = (cleanQuery: string): void | never => {
    // Reject empty string queries
    if (!cleanQuery) throw new TypeError(invalidQueryText(''));

    // Reject queries without a DataModel to SELECT from.
    if (!cleanQuery.match(/^SELECT[\n\s\t]+\*[\n\s\t]+FROM[\n\s\t]+[A-Za-z_]/)) {
        throw new TypeError(invalidQueryText(cleanQuery));
    }

    // Rule out a few basic invalid WHERE clauses.
    if (cleanQuery.match(/WHERE/g) && !cleanQuery.match(/WHERE[\n\s\t]+[a-zA-Z]+/)) {
        throw new TypeError(invalidQueryText(cleanQuery));
    }

    // Ensure no trailing '='
    if (cleanQuery.match(/= +?$/)) throw new TypeError(invalidQueryText(cleanQuery));
};

/***************************************** EXPORT FACTORY *****************************************/
export interface SqlQueryAST {
    type: 'query';
    query: Array<SelectStatement | WhereStatement>;
}

/**
 * @export parseSqlQueryString
 *
 * Construct & return an abstract syntax tree by parsing the given SQL query string
 *
 * @param {string} sqlQuery - A sql query string. Must be in one of the following general forms:
 *     SELECT * FROM _DataModelName_
 *     SELECT * FROM _DataModelName_ WHERE _propertyName_ = '_Property value here_'
 *     SELECT * FROM _DataModelName_ WHERE _prop_ = '_Prop val_' AND _prop2_ = '_Val2_'
 *     SELECT * FROM _DataModelName_ WHERE _prop_ = '_Val1_' AND NOT _prop2_ = '_Val2_'
 *     SELECT * FROM _DataModelName_ WHERE _p1_ = '_V1_' AND NOT _p2_ = '_V2_' AND _p3_ = '_V3_'
 *
 * @return {SqlQueryAST} AST object built from parsing the SQL query. Structure:
 *         {Object { type: 'query',
 *                   query: { type: 'SelectStatement', model: DataModelName } // < Must be 1st
 *                        | { type: 'WhereStatement',
 *                            children: Array<{ type: '_WhereClause'
                                                dataProp: string
 *                                              value: string
 *                                              operation: 'equal' | 'not_equal' }> }}
 *
 * @example Select all travel diseases:
 *          parseSqlQueryString("SELECT * FROM Disease WHERE travel = 'true'");
 * @example Select all travel diseases, but exclude disease with id 12:
 *          parseSqlQueryString(`SELECT * FROM Disease
 *                                        WHERE travel = 'true'
 *                                        AND NOT diseaseId = 12`)
 */
export const parseSqlQueryString = (sqlQuery: string): SqlQueryAST => {
    const cleanQuery = sqlQuery.trim().replace(/;$/, '');
    validateQueryBasic(cleanQuery);
    const charInputStream = new CharInputStream(cleanQuery);
    const tokenStream = new _TokenStream(charInputStream);
    return new _Parser(tokenStream).parse();
};

/******************** RUN THE STREAM IF LOADED IN NODE (FOR TESTING PURPOSES) *********************/
if (isNode) {
    const sqlQuery = `SELECT * FROM SomeClass
                               WHERE methodName = 'test value'
                                 AND methodName2 = 'v\n2'
                                 AND methodName3 = 'A third data value'
                                 AND NOT methodNameN = 'valN'
                                 AND NOT methodNameFINAL = 'Yet Another Value`;

    const prog = parseSqlQueryString(sqlQuery);
    console.log('sql-query-parser :: query string parsing result:', inspect(prog, true, 5, true));
}

// Node-only exports (Used in the REPL, and for testing, debugging, and experiments)
export const __TEST_EXPORTS__ = isNode
    ? {_TokenStream, _Parser, CharInputStream, parseSqlQueryString}
    : null;
