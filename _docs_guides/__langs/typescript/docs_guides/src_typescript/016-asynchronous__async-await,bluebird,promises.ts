// PROMISES: EXAMPLE USE OF bluebird

import * as Promise from 'bluebird';
import * as fs from 'fs';

const readFileAsync = Promise.promisify(fs.readFile);

const fsAsync: any = Promise.promisifyAll(fs) as any;

fsAsync.readFileAsync(path.join(__dirname, '../../test/sample_files/test_1.txt'))
  .then((data: Buffer) => {
    console.log(data.toString());
    return fsAsync.readFileAsync(path.join(__dirname, '../../test/sample_files/test_2.txt'));

  }).then((data: Buffer) => {
    console.log(data.toString());
    return adder(9, 2);

  }).then((data: number) => {
    console.log('---------');
    console.log('3: PART THREE: SUCCESSFULLY ADDED 2 NUMBERS: result: ', data);
    console.log('---------');
    return fsAsync.readFileAsync(path.join(__dirname, '../../test/sample_files/test_4.txt'));

  }).then((data: Buffer) => {
    console.log(data.toString());
    return fsAsync.readFileAsync(path.join(__dirname, '../../test/sample_files/test_5.txt'));

  }).then((data: Buffer) => {
    console.log(data.toString());
    console.log('index.ts:: END OF CHAIN!');
  });

//-----------------------------------------------------------------------------------------------//

// EXAMPLE USE OF async-await

const delay = async (milliseconds: number) =>
    new Promise<void>(resolve => {
        setTimeout(resolve, milliseconds);
    });

const printDelayed = async (elements: string[]) => {
  for (const element of elements) {
    await delay(200);
    console.log('element: ', element);
  }
};

printDelayed(["first", "2", "3", "4", "final"]).then(() => {
  console.log('success!');
  return () => { console.log('do this after first success!'); };
}).then(() => {
  console.log('final success!');
});

//-----------------------------------------------------------------------------------------------//


