**********************************************************************************************
lodash notes
===========
**********************************************************************************************

Chaining
========
Chainable methods of note
---------------------------
1.   map
2.   uniq
3.   pluck
4.   extend (aka assign)
5.   tap
6.   thru
7.   replace ((native))
8.   split ((native))
9.   join ((native))


Full chainable methods list
---------------------------
after, ary, at, before, bind, bindAll, bindKey, callback, chain, chunk, commit, compact, concat, constant, countBy, create, curry, debounce, defaults, defaultsDeep, defer, delay, difference, drop, dropRight, dropRightWhile, dropWhile, fill, filter, flatten, flattenDeep, flow, flowRight, forEach, forEachRight, forIn, forInRight, forOwn, forOwnRight, functions, groupBy, indexBy, initial, intersection, invert, invoke, keys, keysIn, mapKeys, mapValues, matches, matchesProperty, memoize, merge, method, methodOf, mixin, modArgs, negate, omit, once, pairs, partial, partialRight, partition, pick, plant, property, propertyOf, pull, pullAt, push, range, rearg, reject, remove, rest, restParam, reverse, set, shuffle, slice, sort, sortBy, sortByAll, sortByOrder, splice, spread, take, takeRight, takeRightWhile, takeWhile, tap, throttle, thru, times, toArray, toPlainObject, transform, union, unshift, unzip, unzipWith, values, valuesIn, where, without, wrap, xor, zip, zipObject, zipWith



Methods used in isight
======================

	_.bind
	_.bindAll
	_.clone
	_.cloneDeep
	_.debounce
	_.defaults
	_.defaultsDeep
	_.delay(fn, wait,[args])		-- invoke fn after 'wait' ms, with [args] passed
	_.escape(str)								-- ret HTML-escaped val e.g. _.escape('g & gr'); //--> 'g &amp; gr'
	_.extend		/		_.assign		-- WARNING::: MUTATES ORIGINAL
	_.filter										-- _.filter(diffFields, matcher)
	_.find(coll,matcher)				-- ret 1st el matcher ret true for (or that === el in not a fn)
	_.findWhere									-- same as where, but only returns the first item
	_.forEach		/		_.each
	_.functions
	_.get
	_.groupBy
	_.has
	_.includes	/	_.contains		-- _.contains(coll, target, [indexToStartCheckAt])  to either true|false
	_.indexOf										-- conditionMet = _.indexOf(value, model.get(key)) !== -1
	_.invoke(col,path,[*args])	-- invoke method at path of coll, optionally with [args
	_.isEqual(a1, a2)						-- deep comparison to determine if args are equivalent
	_.keys(Obj)									-- may not be needed; basically === Object.keys
	_.map
	_.omit
	_.once(func)								-- fn only runs once, calling it again re-returns 1st call's result
	_.pick
	_.reduce
	_.result(obj, path, [df])		-- like _.get but invokes & rets val from fns in obj; w parent's this
	_.sortBy
	_.throttle									-- var evaluateThrottled = _.throttle(evaluate, 250)
	_.times
	_.toArray(args)							-- turn arguments pseudoarray into actual array
	_.trim(str)									-- remove whitespace around str
	_.uniq
	_.uniqueId([prefix])				-- generate unique numeric id; w prefix if 1 given e.g. --> 'id_412'
	_.values
	_.where(coll,srcObj) 				-- get arr of all els from coll whose prop vals match those in srcObj

	_.first
	_.last
	_.rest

	_.isArray
	_.isBoolean
	_.isEmpty
	_.isFunction
	_.isNull
	_.isNumber
	_.isObject
	_.isPlainObject
	_.isString
	_.isUndefined



---------------------------------------------------------------------------------------------------
Essentials - daily use
======================

Full list
---------

		_.get
		_.has
		_.set

		_.map
		_.reduce
		_.forEach

		_.isArray + _.isObject + _.isFunction
		_.repeat

		_.defaultsDeep
		_.merge
		_.extend   /   _.assign
		_.clone

		_.toArray(arguments)

		_.first
		_.initial
		_.last
		_.rest

		_.chain
		_.thru
		_.tap

		_.pick
		_.omit
		_.uniq

		_.flatten
		_.flattenDeep



***************************************************************************************************
Convert text strings between text 'styles'
==========================================

	_.kebabCase
	_.snakeCase
	_.camelCase
	_.capitalize


***************************************************************************************************
Clone, merge, and extend objects
==========================================
#_.defaultsDeep(destObj, srcObj1, srcObj2, ..., srcObjN)		&&		_.defaults
*   <---- 		  : property precedence direction: right to left

*   Merge all given objs into destObj. Changes destObj; also ret destObj.
*   overwrites destObj props w those redeclared in srcObj1, etc.; & adds new props to destObj
		*   destObj vals overwritten by srcObj1 vals; srcObj1 vals overwritten by srcObj2 vals, etc.
*   !!! WARNING: MUTATES ORIGINAL OBJECT (destObj) !!!


#_.extend(destObj, srcObj1, srcObj2, ..., srcObjN)		/		_.assign
*   ---->       : property precedence direction: left to right

*   1-lvl deep shallow merge all given objs into destObj. Changes destObj; also ret destObj.
*   unlike defaults & defaultsDeep, can only add new props to destObj, no overwriting
*   !!! WARNING: MUTATES ORIGINAL OBJECT (destObj) !!!

#_.merge
*   deep merge version of extend. Also ignores null & undefined prop vals - extend does not.

#_.clone


***************************************************************************************************
Info
====
_.set(obj, path, val)
---------------------
-   set prop value of 'obj' at 'path' to be 'val'
-   example:

			var esOpts = {
				filters: [{
					name: 'can access restricted cases',
					roles: ['view_all_cases', 'restricted']
				},{
					name: 'cant access restricted cases',
					roles: ['']
				}]
			}

			_.set('esOpts.filters[1].roles', 'agent');
					//-->
					// {
					// 	filters: [{
					// 		name: 'can access restricted cases',
					// 		roles: ['view_all_cases', 'restricted']
					// 	},{
					// 		name: 'cant access restricted cases',
					// 		roles: ['agent']
					// 	}]
					// }

_.functions
-----------
-   emit array of all function property names from Object, including inherited!
-   Example

			``_.functions(this)
				--> ['sortRootEls', 'getManagerForModel', 'getManagerForEl' ...]``


_.where(coll,srcObj)
--------------------
-   get arr of all elements from coll whose prop vals match those in srcObj

		var pets = [{ name: 'meeka', type: 'dog' }, { name: 'kyra', type: 'cat'}];
		_.where(pets, {type: 'dog'});
						// --> [{ name: 'meeka', type: 'dog' }]


***************************************************************************************************
Revisit for handling case generation
====================================

	_.flow

##_.drop 		&		_.dropRight
*   Like _.rest & _.initial but lets you rm more than 1; e.g. _.drop(coll, 3); -> drops 1st 3 arr els

##_.take		&		_.takeRight
*   Like _.first & _.last but lets you get more than 1; e.g. _.take(coll, 3); -> gets 1st 3 arr els

##_.union(arr1, arr2, ..., arrn)
*   merges all arrays in args, w/ duplicates rm. e.g.

				_.union([1, 2], [4, 2], [2, 1]);		//--> [1, 2, 4]

##_.without(arr, val1ToRm, val2ToRm, ..., valNToRm)
*   ret new arr w/ given vals rm

##_.compact(arr)
*   ret new arr w all falsy vals rm; i.e. eliminates from arr: '', undefined, false, 0, NaN, & null

##_.remove(arr, filterFn)			<<< filterFn args::: val, index, arr
*   rm all arr els that filterFn ret true for; ret the rm vals. Orig arr now lacks these vals
*   !!! WARNING: MUTATES ORIGINAL ARRAY !!!

##_.property(path)
*   ret prop val at path on given obj e.g. _.property('a.b.c');

***************************************************************************************************
Of interest for logging
====================================
##_.pad(str, length, charsToPadWith)
*    pad str on left & right if str shorter than given length; e.g. _.pad('abc', 6); //--> ' abc  '


***************************************************************************************************
Add to lodash itself
====================
_.mixin
-------
*   example:

    _.mixin({

      _hasNoDot: function _hasNoDot(char){
        if(_.isString(char) && char.length === 1) {
          return val !== '.';
        }
        if (_.isString(char)){
          return !_.includes(char.split(''), '.');
        }
        if (_.isArray(char)){
          return !_.includes(char, '.');
        }
      },

      // Standard sort on arrays that contain both numeric and string values
      sortNumStrMixArr: function sortMixNumStrArr(coll) {
        if (!(_.isArray(coll))) {
          return _.sortBy(coll);
        }
        return _.sortBy(coll, function (val) {
          if (_.isNumber(val)) {
            var valAsStrArr = (_._hasNoDot(val))
            	? (val + '.0').split('')
            	: (val + '').split('');
            var intPt = _.takeWhile(valAsStrArr, this._hasNoDot).join('');
            var intPtPadded = _.padLeft(Math.floor(intPt), 50, '0');
            var decPt = _.takeRightWhile(valAsStrArr, this._hasNoDot).join('');
            return intPtPadded + '.' + decPt;
          }
          return val;
        });
      }

    });


    console.log(_.sortNumStrMixArr([3, 'awef, 4, 1, 'few', 'z', 321, 'aaa', 2, 'bab', 'efe']));
        //--> [1, 2, 3, 4, 321, 'aaa', 'awef', 'bab', 'efe', 'few', 'z']


***************************************************************************************************
Tricks
======
-   can get values matching given key from objects in given array via _.map(coll, 'keyToMatchOn');

		var dogs = [
    	{ name: 'callie', age: '15' },
    	{ name: 'meeka', age: '4' }
		];
		_.map(dogs, 'name');
			//--> ['callie','meeka']
