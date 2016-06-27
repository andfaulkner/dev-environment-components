# encoding: utf-8
# rubocop:disable HashSyntax

require "./tasks/avdi_tutorial/source_files"

# EX. 5: Pathmaps
# ===============
# Pathmap: Rake power tool for munging filenames. A pathmap takes as its argument a specification,
# which is a string containing codes corresponding to different parts of the original filenames.
#
# Codes in the specification:
# %p      gives the whole original path
# %n      renders file base name without dir or ext
# %d      gives directory but not file name
# %x      gives file extension only
# %X      gives everything BUT the extension

puts "SOURCE FILES VIA %p: #{SOURCE_FILES.pathmap('%p')}"