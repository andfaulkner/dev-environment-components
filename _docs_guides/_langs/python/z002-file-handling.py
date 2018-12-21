#--------------------------------------------- IMPORT ---------------------------------------------#
from os import path

#----------------------------------------- GET FILE PATH ------------------------------------------#
# Get path to current file's directory
cur_file_path = path.realpath(path.dirname(__file__))
print("Path to current (python) file's directory:", cur_file_path)

# Get path to test file (relative to current directory)
test_file_path = path.join(cur_file_path, 'misc', 'test-file.txt')
print("Path to test file:", test_file_path)

#------------------------------------------- READ FILE --------------------------------------------#
# Always open in a with block to ensure the file gets closed if a crash occurs
with open(test_file_path) as f:
    print("\nFull file path:", f.name)
    print("\nFile name:", path.basename(f.name))
    print("File content:\n", f.read(), "\n")
