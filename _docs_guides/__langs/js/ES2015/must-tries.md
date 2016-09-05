##Destructuring
###Examples
		var o = {p: 42, q: true};
		var {p, q} = o;
		console.log(p); // 42
		console.log(q); // true 

		let {kind, objectType, url, id} = profile._json;

		let node = {
			type: "Identifier",
			name: "foo"
		};
		let { type, name } = node;

		// GREAT EXAMPLE OF RENAMING AS YOU GO
		let node = {
		  type: "Identifier",
		  name: "foo"
		};
		let { type: localType, name: localName } = node;
		console.log(localType);     // "Identifier"
		console.log(localName);     // "foo"

		var metadata = {
		    title: "Scratchpad",
		    translations: [{
		      last_edit: '2014-04-14T08:43:37',	url: '/de/docs/Tools/Scratchpad', locale: 'de',
		      title: 'JavaScript-Umgebung',			localization_tags: []
		    }],
		    url: "/en-US/docs/Tools/Scratchpad"
		};
		var { title: englishTitle, translations: [{ title: localeTitle }] } = metadata;
		console.log(englishTitle); // "Scratchpad"
		console.log(localeTitle);  // "JavaScript-Umgebung"

		// Use of destructuring with rest
		var { checked, ...other } = props;
			// checked = props.checked;  other = { ...every prop in props besides 'checked'... }

##Array includes
*	 Array.prototype.includes

##Rest params
*	 rest params are arrays! (not arguments objects);

		function countArgsPastTwo (a, b, ...theArgs) {
			console.log(theArgs.length);
		}

		countArgsPastTwo('arg1', 2, 'arg3', 'anotherArg', 5); // => 3

*	  allows:

				theArgs.map
				theArgs.each
				theArgs.sort
				theArgs.length
				... anything arrays allow

##Spread params
		function myFunction(x, y, z) { }
		var args = [0, 1, 2];
		myFunction(...args);
