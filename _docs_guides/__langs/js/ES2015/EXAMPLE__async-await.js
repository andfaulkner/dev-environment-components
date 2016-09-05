//
// examples of async-await usage
//
// note that await can only be used inside an async function
async function test() {

  async function test2(delay) {
    return new Promise<void>(resolve => {
      console.log('1:: runs first');
      setTimeout(resolve, delay);
    });
  }
  const test3 = async () => {
    return new Promise<void>(resolve => {
      console.log('3:: runs third');
      resolve();
    });
  };

  const test4 = async () => {
   console.log('4:: runs fourth');
  };

  await test2(400); // suspend execution until test2 returns
  await test3();
  await test4();
  console.log('5:: runs fifth');
}

test().then(() => {
  console.log('6:: runs sixth - when the end of the async function is reached');
});