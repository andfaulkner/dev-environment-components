import test from 'tape';

//
//  RANDOM EXAMPLE DATA
//

const poohAnimal = 'bear';

const places = ['forest', 'cave', 'volcano'];
const animal1 = {
  home: 'cave',
  type: { class: 'mammal', species: 'bear' },
  name: 'Jeremy Stewart-Baxter'
};

const animal2 = {
  home: places[1],
  type: { class: 'mammal', species: poohAnimal },
  name: 'Jeremy Stewart-Baxter'
};

const animal3 = {
  home: 'cave',
  type: { class: 'mammal', species: 'bear', subspecies: 'grizzly' },
  name: 'Jeremy Stewart-Baxter'
}

function hello() {
  console.log('hello tape!');
}

function letsThrow() {
  throw new Error('FAIL');
}
//
//  ACTUAL TEST ASSERTIONS
//

test('BASIC TRUTHINESS ASSERTIONS WITH TAPE', function (t) {
  t.ok(true, 'yep, true is truthy');
  t.notOk(false, 'yep, false is falsy');
  t.end();
});

test('BASIC EQUALITY ASSERTIONS WITH TAPE', (t) => {
  t.notEqual(poohAnimal, 'fish', 'Pooh is not a fish!');
  t.equal(poohAnimal, 'bear', 'Pooh is a bear!');
  t.deepEqual(animal1, animal2, 'The 2 animal objects are equal, including all nested props.');
  t.notDeepEqual(animal1, animal3,
    'The animal objs arent deep-equal: the 2nd has an extra nested prop');
  t.end();
});


test('TESTING FUNCTION SUCCESS OR FAILURE WITH TAPE', function (t) {
  t.doesNotThrow(function () {
    // hello();
    letsThrow();
  });

  t.throws(function () {
    letsThrow();
  });

  t.end();
});

test('TEST THAT A GIVEN NUMBER OF ASSERTIONS RAN', function(t) {
  t.plan(2)
  
  t.error(false, 'value given to t.error was not falsy');
  t.comment('hello everyone! t.comment does not count as an assertion.');
  t.pass('I pass no matter what! And I count as an assertion!');
  
  t.end();
});
