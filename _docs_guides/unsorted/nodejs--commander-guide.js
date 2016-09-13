
/** EXAMPLE 1 */
program
  .version('0.0.1') // shows up in help output as an option. Makes -v work.
  // <> args are mandatory. [] args are optional.
  // Names within the brackets become variables in the next action.
  .arguments('<cmd> [env]')
  .action(function (cmd, env) {
     cmdValue = cmd;
     envValue = env;
  });

program.parse(process.argv);

program
  .version('0.0.1') // shows up in help output as an option. Makes -v work.
  .command('install [name]', 'install one or more packages')
  .parse(process.argv);
  