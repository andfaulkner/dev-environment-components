import sublime
import sublime_plugin
import os

class ExampletwoCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        print(self.view.sel()[0].begin())
        # self.view.insert(edit, self.view.sel()[0].begin(), "GRRRR")
        # self.view.insert(edit, 0, "Hello, World!")
        print(self.view.sel()[0])
        print("TEST OUTPUT")
        print(dir(self.view.line(self.view.sel()[0].begin())))
        print(self.view.line(self.view.sel()[0].begin()).b)
        print("Current working dir full path: ", os.getcwd())
        print("Current file's containing dir path: ", os.path.dirname(__file__))
        print("Current file path: ", os.path.realpath(__file__))
        print("Current dir name: ", os.path.dirname(__file__).split(os.sep)[-1])
        print(os.path.dirname(os.path.realpath(__file__)))