--########################################### COMMENTS ###########################################--
-- Done like this

--############################################ PRINT #############################################--
print(s, e)


--############################################ COLON #############################################--
-- something:thing
-- The colon is for implementing methods that pass self as the first parameter

function object:method(arg1, arg2)
  -- same as this
function object.method(self, arg1, arg2)

--########################################## VARIABLES ###########################################--
hello = "helloooooooooo!"

--######################################### COMPARISONS ##########################################--
-- if-then-elseif-else

-- regular if
function wasIt1(num)
  if num == 1 then
    print("it was one!")
  end
end

-- with else
function wasIt1OrSomethingElse(num)
  if num == 1 then
    print("it was one!")
  else
    print("it was not one!")
  end
end

-- with elseif
function withIt1Or2OrElse(num)
  if num == 1 then
    print("it was one!")
  elseif num == 2 then
    print("it was two!")
  else
    print("it was not one!")
  end
end


--################################### GET THE "PARENT" SCRIPT ####################################--
sp = script.Parent

--########################################## FUNCTIONS ###########################################--
-- Basic:
function hello()
  print("hello")
end

-- With return:
function helloRet()
  print("hello2");
  return "aloha";
end

-- Example:
function maximum (a)
  local mi = 1          -- maximum index
  local m = a[mi]       -- maximum value
  for i,val in ipairs(a) do
    if val > m then
      mi = i
      m = val
    end
  end
  return m, mi
end

