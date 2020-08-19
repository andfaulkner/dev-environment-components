from __future__ import print_function

#--------------------------------------------- IMPORT ---------------------------------------------#
import os
import shutil

#---------------- DIRECTORY NAVIGATION ----------------#
# Get current working directory
os.getcwd()

# Get contents of current dir
os.listdir('./')

# Change current directory
os.chdir('./new_dir_relative_to_current_one')

# Copy a file
shutil.copy('./src-file.ext', './dest-file.ext')

# Delete a file
os.remove('./some-file.ext')

# Make a directory
os.mkdir('./my-new-directory')

# Delete directory recursively
shutil.rmtree('./my-new-directory')

#--------------- CONVENIENCE FUNCTIONS ----------------#
def ls():
    """
    Function to get current directory's content
    """
    return os.listdir('./')

