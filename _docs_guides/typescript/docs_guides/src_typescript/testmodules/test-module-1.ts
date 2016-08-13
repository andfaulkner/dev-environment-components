export const testExportString: string = 'testExportString successfully imported!';

export var testExportFunction = (randomString : string) : string => {
  let out = `testExportFunction is running! You gave it an arg with value: ${randomString}.`
  console.log(out);
  return out;
}
