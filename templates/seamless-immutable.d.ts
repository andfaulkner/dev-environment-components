declare module "seamless-immutable" {
                interface ImmutableCommonMethods<T>{
                               setIn?(propertyPath: Array<string|number>, value: any): Immutable<T>;
                               merge?(part: T): Immutable<T>;
                }

                export interface ImmutableObject<T> extends ImmutableCommonMethods<T> {
                               set(property: string, value: any): Immutable<T>;
                               setIn(propertyPath:Array<string>, value:any):Immutable<T>;

                               asMutable(): T;
                               asMutable(opts:AsMutableOptions): T;

                               update(property:string, updaterFunction:(value:any) => any):Immutable<T>;
                               update(property:string, updaterFunction:(value:any, additionalParameter1:any) => any, arg1:any):Immutable<T>;
                               update(property:string, updaterFunction:(value:any, additionalParameter1:any, additionalParameter2:any) => any, arg1:any, arg2:any):Immutable<T>;
                               update(property:string, updaterFunction:(value:any, additionalParameter1:any, additionalParameter2:any, additionalParameter3:any) => any, arg1:any, arg2:any, arg3:any):Immutable<T>;
                               update(property:string, updaterFunction:(value:any, additionalParameter1:any, additionalParameter2:any, additionalParameter3:any, additionalParameter4:any) => any, arg1:any, arg2:any, arg3:any, arg4:any):Immutable<T>;

                               updateIn(propertyPath:Array<string>, updaterFunction:(value:any) => any):Immutable<T>;
                               updateIn(propertyPath:Array<string>, updaterFunction:(value:any, additionalParameter1:any) => any, arg1:any):Immutable<T>;
                               updateIn(propertyPath:Array<string>, updaterFunction:(value:any, additionalParameter1:any, additionalParameter2:any) => any, arg1:any, arg2:any):Immutable<T>;
                               updateIn(propertyPath:Array<string>, updaterFunction:(value:any, additionalParameter1:any, additionalParameter2:any, additionalParameter3:any) => any, arg1:any, arg2:any, arg3:any):Immutable<T>;
                               updateIn(propertyPath:Array<string>, updaterFunction:(value:any, additionalParameter1:any, additionalParameter2:any, additionalParameter3:any, additionalParameter4:any) => any, arg1:any, arg2:any, arg3:any):Immutable<T>;

                               without(property:string):Immutable<T>;
                               without(propertyPath:string[]):Immutable<T>;
                               without(...properties:string[]):Immutable<T>;
                               without(filter:(value:any, key:string) => boolean):Immutable<T>;
                }

                export interface ImmutableArray<T> extends ImmutableCommonMethods<T> {
                               set(index: number, value: any): ImmutableArray<T>;
                               asMutable(): Array<T>;
                               asMutable(opts:AsMutableOptions): Array<T>;
                               asObject(toKeyValue: (item: T) => Array<Array<any>>): ImmutableArray<T>;
                               flatMap(mapFunction: (item: T) => ImmutableArray<T>): any;

                               // TODO review methods (missing ones for arrays?)
                }

                interface Options {
                               prototype?: any;
                }

                interface AsMutableOptions {
                               deep: boolean;
                }

                // an immutable object is both of Type T (i.e., looks like a normal T) and of type Immutable<T>
                export type Immutable<T> = T & (ImmutableObject<T> | ImmutableArray<T>);

                // TODO it would be ideal to be able to expose that type and have the variable available from client code
                // couldn't figure out how to do this unfortunately
                /*
                export type SeamlessImmutable = {
                               <T>(obj: T, options?: Options): T & ImmutableObject<T>;
                               <T>(obj: Array<T>, options?: Options): Array<T> & ImmutableArray<T>;
                               from:SeamlessImmutable;
                               isImmutable(target: any): boolean;
                               ImmutableError(message: string): Error;
                };

                export const Immutable: SeamlessImmutable;
                */

                export function from<T>(obj: T, options?: Options): T & ImmutableObject<T>;
                export function from<T>(obj: Array<T>, options?: Options): Array<T> & ImmutableArray<T>;

                export function isImmutable(target: any): boolean;
                export function ImmutableError(message: string): Error;
}
