#sh

require 'etc'

# ARGF			handles streams coming in
# $_				global var set to current line being processed, if ruby invoked w ruby -ne '...etc...'
#
# -p				flag ruby can be run with e.g. ruby -pe 'code here'. Akin to:
#									while gets
#										# other code here
#										puts $_
#									end
#							...but also picks up chained transformations on $_ - so long as they mutate $_ - e.g.
#									echo "eats, shoots, and leaves" | ruby -pe '$_.gsub!("e", "a")'
#											# => aats, shoots, and laavas
#							Note that, because e.g. capitalize is non-mutative, the following:
#									echo "eats, shoots, and leaves" | ruby -pe '$_.gsub!("e", "a").capitalize'
#								...has the same result as if capitalize were not included

echo "------------------------------------------------------------------------------------------"
################################################
#          RUNNING RUBY CODE FROM CLI          #
################################################
echo "***************** RUNNING RUBY CODE FROM CLI *****************"
echo " ----- RUN SINGLE LINE RUBY CODE FROM CLI -----"
ruby -e "puts 'hello cli!'" # => hello cli!

echo " ----- REQUIRE A MODULE FOR USE IN A SINGLE LINE OF RUBY CODE RUN FROM CLI, & USE IT -----"
echo " ----- REQUIRE date MODULE W -r CLI ARG, USE TO DISPLAY DATE AT GIVEN YEAR, MONTH, DAY -----"
ruby -r date -e "puts Date.new(2016,11,22)"		# => 2016-11-22

# This would otherwise return an error, since Date only works if you require 'date'

echo "------------------------------------------------------------------------------------------"
##################################################
#          STREAMING INTO RUBY FROM CLI          #
##################################################
echo "***************** STREAMING INTO RUBY FROM CLI *****************"

echo " ----- STREAM STDOUT (FROM cat ON A TESTFILE) INTO RUBY CODE W EACH LINE SET IN \$_ -----"
cat testfiles/2line_testfile.txt | ruby -ne 'puts $_'
# => First line of test file!
#    Second and last line of test file (followed by a blank line)!

echo " ----- PREPEND 'ITEM:' TO EACH LINE STREAMED INTO RUBY CODE -----"
cat testfiles/2line_testfile.txt | ruby -ne 'puts "ITEM: #{$_}"'
# => ITEM: First line of test file!
#    ITEM: Second and last line of test file (followed by a blank line)!

echo " ----- AUTO-OUTPUT \$_ VALUE AT END OF SINGLE-LINE RUBY CODE W/OUT PUTS VIA '-p' ARG -----"
cat testfiles/2line_testfile.txt | ruby -pe '$_'
# => ITEM: First line of test file!
#    ITEM: Second and last line of test file (followed by a blank line)!

echo " ----- OUTPUT RESULT OF MUTATIVE TRANSFORMATION CHAIN ON \$_ (RUN w/ '-p' ARG) -----"
echo "eats, shoots, and leaves" | ruby -pe '$_.gsub!("e", "a")'
# => aats, shoots, and laavas

echo " ----- OUTPUT RESULT OF NON-MUTATIVE TRANSFORMATION CHAIN ON \$_ (RUN w/ '-p' ARG) -----"
# Note that running capitalize does nothing here, because it doesnt mutate the variable its run on
echo "eats, shoots, and leaves" | ruby -pe '$_.gsub!("e", "a").capitalize'
# => aats, shoots, and laavas

echo " ----- OUTPUT \$_ AFTER EXPLICITLY MODIFYING ITS VALUE (RUN w/ '-p' ARG) -----"
# This time capitalize works
echo "eats, shoots, and leaves" | ruby -pe '$_ = $_.gsub!("e", "a").capitalize'
# => Aats, shoots, and laavas



echo "------------------------------------------------------------------------------------------"
#############################################
#          ACCESS STREAM WITH ARGF          #
#############################################
echo "***************** ACCESS STREAM WITH ARGF *****************"
