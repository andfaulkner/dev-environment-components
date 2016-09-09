# basic logging
print("hello! I'm python logging!")

################################# logging with the logging module #################################
import logging
logging.basicConfig(level=logging.DEBUG)  # set to level debug, from the default "info"
# logging.basicConfig only works directly after the import logging statement.

logging.critical("DANGER! RADIATION LEAK! IMPENDING NUCLEAR BLAST! THE MOON HAS HIT THE EARTH!!!!")
logging.error("Nice job, no job. FAIL.")
logging.warn("Hey! What are you doing? Stop doing that, you're a moron! Fool! Cut it out!")
logging.warning("uh-oh, could be bad! (maybe)")
logging.info("Yo dogg, I heard you like hearing about lots of mildly" +
             "but not greatly interesting things")

logging.debug("hey! hey! hey! Look at me! hey! hey! Are you looking? Hey! Hey! Hey!" +
              "hey! You need to listen! HEY! HEY! Look, it's a cat. hey! Check out that" +
              "rock over there. hey! hey! hey! hey! come on! guy! you!! I have a belly button!")

# logging.verbose("(*you suspect there's a slight increase in the wind but that's all" +
                # "  A tumbleweed drifts by.")
#           /\-- logging has no method 'verbose'

############################### LOGGING WITH A CUSTOM LOGGER OBJECT ###############################
logger = logging.getLogger('simple_example')
logger.setLevel(logging.DEBUG)

logger.log(logging.DEBUG, "HEY! HEY! HEY! MORE OF ME! HEY! OMGOMG LOOK AT THOSE CURTAINS! HEY!")

#### get all methods on an object

# if callable because only do it if the attribute is something that can be
# called (i.e. a function) - other properties are not methods
print([method for method in dir(object) if callable(getattr(object, method))])

