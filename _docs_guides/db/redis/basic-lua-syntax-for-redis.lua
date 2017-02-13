--########################## LINKS WITH INFO ON LUA SCRIPTING FOR REDIS ##########################--
-- https://www.redisgreen.net/blog/intro-to-lua-for-redis-programmers/
-- https://medium.com/@stockholmux/save-node-js-headaches-with-lua-and-redis-165df4a620b5#.ctbzibesl
-- http://beforeitwasround.com/2014/07/using-lua-to-implement-multi-get-on-redis-hashes.html
    -- EXCELLENT. Using variant of script defined within.

--########################################### COMMENTS ###########################################--
-- Lua single-line comments are done like this

--[[
        Multiline Lua comments are like this
--]]

--###################################### LOGGING AND OUTPUT ######################################--
-- ####### Output a value ####### --
print(10)

-- ####### Write to the redis log ####### --
-- General syntax:
redis.log(loglevel,message)

--[[...where loglevel is one of:
        redis.LOG_DEBUG
        redis.LOG_VERBOSE
        redis.LOG_NOTICE
        redis.LOG_WARNING ]]

-- Example:
redis.log(redis.LOG_WARNING,"omnomnomnom")

--#################################### VARS AND RETURN VALUES ####################################--
-- ####### RETURN ####### --
-- Example:
return 1;

-- ####### STORE LOCAL VARIABLES ####### --
local msg = "Hello, world!"

--#################################### RUNNING REDIS COMMANDS ####################################--
-- ####### RUN A REDIS COMMAND ####### --
-- Example:
 local name=redis.call("get", KEYS[1])
 local greet=ARGV[1]
 local result=greet.." "..name
 return result
    -- above stores output in a variable


