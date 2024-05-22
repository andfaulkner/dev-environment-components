echo "* CLI options loading..."

# get a huge history, preserve it across windows
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
export PROMPT_COMMAND='history -a; history -c; history -r'

### GROOVY ###
# export GROOVY_HOME=/usr/local/opt/groovy/libexec

################################################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ JAVA SETTINGS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
################################################################################
# export ES_CLASSPATH=$ES_CLASSPATH:$ES_HOME/lib/elasticsearch-1.6.1.jar:$ES_HOME/lib/*:$ES_HOME/lib/sigar/*

# if [ "x$ES_MIN_MEM" = "x" ]; then
#     ES_MIN_MEM=256m
# fi
# if [ "x$ES_MAX_MEM" = "x" ]; then
#     ES_MAX_MEM=1g
# fi
# if [ "x$ES_HEAP_SIZE" != "x" ]; then
#     ES_MIN_MEM=$ES_HEAP_SIZE
#     ES_MAX_MEM=$ES_HEAP_SIZE
# fi

# JAVA_OPTS="$JAVA_OPTS -Xms${ES_MIN_MEM}"
# JAVA_OPTS="$JAVA_OPTS -Xmx${ES_MAX_MEM}"
# JAVA_OPTS="$JAVA_OPTS -Djava.awt.headless=true"
# JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError"
# JAVA_OPTS="$JAVA_OPTS -XX:+DisableExplicitGC"
# JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8"
# JAVA_OPTS="$JAVA_OPTS -XX:+UseParNewGC"
# JAVA_OPTS="$JAVA_OPTS -XX:+UseConcMarkSweepGC"
# JAVA_OPTS="$JAVA_OPTS -XX:CMSInitiatingOccupancyFraction=75"
# JAVA_OPTS="$JAVA_OPTS -XX:+UseCMSInitiatingOccupancyOnly"
# export JAVA_OPTS;

# if [ -z $CLASSPATH ]; then
#   CLASSPATH=/usr/share/java
# else
#   CLASSPATH=$CLASSPATH:/usr/share/java
# fi
################################################################################

# export CLASSPATH;

echo "* CLI options loaded!"
