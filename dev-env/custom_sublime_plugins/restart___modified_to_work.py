import sublime, sublime_plugin, os, sys, subprocess

__author__ = 'Hassen Ben Yeddder; Andrew Faulkner'
__email__ = 'hassenbenyedder@gmail.com; andfaulkner@gmail.com'

class RestartCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        path = sublime.load_settings("Restart.sublime-settings").get("path")
        
        if sys.platform == 'win32':
            if sublime.version()[:1]=='3':
                subprocess.call('taskkill /im sublime_text.exe /f && cmd /C "'+ os.path.join(os.getcwd(), 'sublime_text.exe') + '"', shell=True)
            else:
                os.execl(sys.executable,' ')

        elif sys.platform == 'darwin':
            #Restarting ST3 on mac
            if sublime.version()[:1]=='3':
                executable_name = ''

                #Find the sublime executable
                if subprocess.call("which sublime", shell=True)==0:
                    executable_name = 'sublime'
                elif subprocess.call("which subl", shell=True)==0:
                    executable_name = 'subl'

                #Only attempt to restart sublime if an executable was found
                if executable_name!='':
                    subprocess.call("""
                        ps aux |
                            grep '\/Sublime Text\(\($\)\|\(\(\s[^0-9\/]\)[^\/]*\)\)' |
                            awk '{print $2}' |
                            xargs kill -9;
                        sleep 0.1;
                        %(executable_name)s --command noop;
                    """ % locals(), shell=True)
                else:
                    print('Sublime not found in path. Set up path such that running "sublime" or "subl" in the terminal launches Sublime')

            else:
                os.execl(os.path.join(os.getcwd(), 'subl'))

        else:
            #Restarting ST3 on linux
            if sublime.version()[:1]=='3':
                subprocess.call("pkill 'sublime_text' && "+ os.path.join(os.getcwd(), 'sublime_text'), shell=True)

            else:
                os.execl(os.path.join(os.getcwd(), 'sublime_text'))
