#!/usr/bin/env node

const {getRandomInt} = require('mad-utils');

const roll = () => getRandomInt(1, 20);

console.log(`Does it look like anyone lives there?`, '\n');
console.log(`Is there a chimney with smoke coming out?`, '\n');
console.log(`Is there a door?`, '\n');
console.log(`Are there windows?`, '\n');

const natureRoll1 = roll();
const natureRoll2 = roll();
const natureRoll = ((natureRoll1 > natureRoll2) ? natureRoll1 : natureRoll2) + 1;

console.log(`Any cool plants?`);
console.log(`NATURE RESULT: ${natureRoll} / 20`, '\n');

console.log(`Any other cool shit?`);
console.log(`INVESTIGATION RESULT: ${roll() + 4} / 20`);
console.log(``);


/**
 * Jordan   :: Bo
 *             Runty wood elf
 *             5'8
 *             Has disheveled chain mail
 *             Flowing locks
 *             Dislikes other wood elves
 *
 * Karen    :: Tyra
 *             Half-orc
 *             Dead family
 *             Sibling of
 *
 *
 * Guillian :: Tobias
 *             She-hulk - grayish dark greenish tinted skin
 *             Tusks coming out of lower jaw - a little smaller than orc tusks
 *             Giant beast bone coming out of side
 *             Deep sunken eyes
 *             Strong brow
 *             Long black hair
 *
 * Darin Sildermath
 */
