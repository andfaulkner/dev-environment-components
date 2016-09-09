#!/usr/bin/env node

// As seen above, add this to top of file to make it a node executable:
// 				#!/usr/bin/env node
// Add this to new Node cli app's package.json:
// 
//  	"bin": {
// 			"gitsearch": "gitsearch.js"
// 		}
//
// Access args given to cli tool via 		process.argv
// 
// Get commander module to make the actual tool, and require it:
var program = require('commander');
var colors = require('colors');
var _ = require('lodash');

// Example use:

// Typing node-cli-tools.js into the terminal yields:
// 
//      Usage: node-cli-tools <animal-name> <animal-type> [fav-things...]
//
//
//      Commands:
//
//         <animalType> [fav-things...]  Find out about meeka
//        help [cmd]                     display help for [cmd]
//
//      Options:
//
//        -h, --help                    output usage information
//        -V, --version                 output the version number
//        -o, --owner [name,name2,...]  The owners of the animal
//

program
    .version('0.0.1')
    .usage('<animal-name> <animal-type> [fav-things...]')
    .arguments('<cmd> <animalType> [favoriteThings...]')
    .command(' meeka <animalType> [fav-things...]', 'Find out about meeka')
    .option('-o, --owner [name,name2,...]', 'The owners of the animal')
    // Angled brackets (e.g. <cmd>) indicate required input. 
    // Square brackets (e.g. [env]) indicate optional input. 3 dots at end = variadic input
    .action(function(name, animalType, favoriteThings) {
    	switch(name) {
    		case 'meeka':
	    		meeka(name, animalType, favoriteThings)
	    		break;
	    	default: console.log('unknown dog')
    	}
    	animalType = animalType;
    	favoriteThings = favoriteThings;
    });
    // Trouble, figure out multiple actions later
    // .command('meeka <animalType> [interest-1] [interest-2]', 'test command')
    // .command('test [testval]', 'test command')	// <--runs external cmd node-cli-tools-test (?)
    // also appears to just provide info

// actually render the program
program.parse(process.argv);

// Display help if no args given
if(!program.args && !program.owner) {
    program.help();
}


function meeka(name, animalType, favoriteThings) {
    console.log('name: ' + name)
    if (_.isArray(favoriteThings) && favoriteThings.length >= 2) {
        console.log('Meeka is a ' + animalType + '. She likes to ' + favoriteThings[0] + 
            ' as well as ' + favoriteThings[1]) + '.';
    } else if (_.isArray(favoriteThings) && favoriteThings.length === 1) {
        console.log('Meeka is a ' + animalType + '. She likes to ' + favoriteThings[0] + '.');
    } else if (_.isString(favoriteThings)) {
        console.log('Meeka is a ' + animalType + '. She likes to ' + favoriteThings + '.');
    } else {
        console.log('Meeka is a ' + animalType + '. She likes to do lots of cute fluffy things.');        
    }
    if (program.owner && program.owner.match(',')) {
        console.log('Meeka is owned by ' + program.owner.split(',').join(' and '))
    } else if (program.owner) {
        console.log('Meeka is owned by ' + program.owner);        
    } else {
        console.log('Meeka is owned by someone who pets her lots.');
    }
}