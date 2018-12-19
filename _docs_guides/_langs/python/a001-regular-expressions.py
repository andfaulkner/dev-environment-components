import re

line = "Meeka is a big ball of fluff"

matchObj = re.match(r'(.*) big (.*?) .*', line, re.M|re.I)

if matchObj:
	print "matchObj.group() : ", matchObj.group()
	print "matchObj.group(1) : ", matchObj.group(1)
	print "matchObj.group(2) : ", matchObj.group(2)
else:
	print "No match!!"

if matchObj:
    print "matchObj.groups: ", matchObj.groups()

# SEARCHING (DIFFERENT FROM MATCHING!):
# match checks for a match only at the beginning of the string, while
# search checks for a match anywhere in the string

searchObj = re.search(r'(.*) big (.*?) .*', line, re.M|re.I)

if searchObj:
    print "search.groups(): ", searchObj.groups()

# FLAGS
# re.I	Performs case-insensitive matching.
# re.L	Interprets words according to the current locale. This
# 	interpretation affects the alphabetic group (\w and \W),
#	as well as word boundary behavior (\b and \B).
# re.M	Makes $ match the end of a line (not just the end of the string)
# 	and makes ^ match the start of any line (not just the start of the string).
# re.S	Makes a period (dot) match any character, including a newline.
# re.U	Interprets letters according to the Unicode character set.
#	This flag affects the behavior of \w, \W, \b, \B.
# re.X	Permits "cuter" regular expression syntax. It ignores whitespace (except
#	inside a set [] or when escaped by a backslash) and treats unescaped #
#	as a comment marker.

