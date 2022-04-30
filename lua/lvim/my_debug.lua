local M = {}

function M:writeFile(content)
  local root_dir = os.getenv("HOME")
  local f = assert(io.open(root_dir .. "/.cache/mydebug", 'a+'))
  f:write(content)
  f:close()
end

function M:print_r(t)
  local print_r_cache = {}
  local function sub_print_r(t, indent)
    if (print_r_cache[tostring(t)]) then
      M:writeFile(indent .. "*" .. tostring(t))
    else
      print_r_cache[tostring(t)] = true
      if (type(t) == "table") then
        for pos, val in pairs(t) do
          if (type(val) == "table") then
            M:writeFile(indent .. "[" .. pos .. "] => " .. tostring(t) .. " {")
            sub_print_r(val, indent .. string.rep(" ", string.len(pos) + 8))
            M:writeFile(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
          elseif (type(val) == "string") then
            M:writeFile(indent .. "[" .. pos .. '] => "' .. val .. '"')
          else
            M:writeFile(indent .. "[" .. pos .. "] => " .. tostring(val))
          end
        end
      else
        M:writeFile(indent .. tostring(t))
      end
    end
  end

  if (type(t) == "table") then
    M:writeFile(tostring(t) .. " {")
    sub_print_r(t, "  ")
    M:writeFile("}")
  else
    sub_print_r(t, "  ")
  end
  M:writeFile("\n")
end

return M
