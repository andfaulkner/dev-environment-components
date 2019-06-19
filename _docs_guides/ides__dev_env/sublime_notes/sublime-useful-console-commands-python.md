List all installed packages
---------------------------
import os; [(os.path.dirname(file)[len('Packages/'):], sublime.decode_value(sublime.load_resource(file))['url']) for file in sublime.find_resources('package-metadata.json')]


Log all commands in console
---------------------------
sublime.log_commands(True)
sublime.log_commands(False)
