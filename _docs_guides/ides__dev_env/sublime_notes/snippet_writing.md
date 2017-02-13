#Content tag - regular expressions

##For info on text matches (in content section):

	http://www.boost.org/doc/libs/1_56_0/libs/regex/doc/html/boost_regex/syntax/perl_syntax.html

##For info on text 'replacements':

	http://www.boost.org/doc/libs/1_56_0/libs/regex/doc/html/boost_regex/format/boost_format_syntax.html

	* Essentials:

			$`				outputs all text preceding the start of the current match (but following end of prev match)
			$&				outputs the entire current match
			$'				outputs all text following the end of the current match

