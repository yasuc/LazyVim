if false then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- emmet parserの実装
local lpeg = vim.lpeg
local name = (lpeg.P(1) - lpeg.S "#.[>") ^ 1
local tag = lpeg.Cg(name, "tag")
local id = lpeg.P "#" * name
local cls = lpeg.P "." * name
local kv = lpeg.P { "[" * ((1 - lpeg.S "[]") + lpeg.V(1)) ^ 0 * "]" }
local child = lpeg.P ">" * lpeg.P(1) ^ 1
local attr = lpeg.C(child + kv + id + cls) ^ 0

local kindmap = {
  ["."] = "class",
  ["#"] = "id",
  ["["] = "kv",
  [">"] = "child",
}

local function parse(s)
  local splits = lpeg.match(lpeg.Ct(tag * attr), s)

  if type(splits) ~= "table" then return end

  local res = {
    tag = splits.tag,
    class = {},
    id = {},
    kv = {},
    child = nil,
  }

  for _, sp in ipairs(splits) do
    local k, v = string.match(sp, "(.)(.*)")
    local kind = kindmap[k]
    if kind == "child" then
      res.child = parse(v)
    else
      if kind == "kv" then v = string.gsub(v, "%]$", "") end
      table.insert(res[kind], v)
    end
  end

  return res
end

-- emmet -> HTMLタグの変換の実装
local function opentag(x)
  local res = "<" .. x.tag
  if #x.id > 0 then res = res .. ' id="' .. x.id[1] .. '"' end
  if #x.class > 0 then res = res .. ' class="' .. table.concat(x.class, " ") .. '"' end
  if #x.kv > 0 then res = res .. " " .. table.concat(x.kv, " ") end
  res = res .. ">"
  if x.child then res = res .. opentag(x.child) end
  return res
end

local function closetag(x)
  local res = ""
  if x.child then res = closetag(x.child) .. res end
  res = res .. "</" .. x.tag .. ">"
  return res
end

local function totag(x)
  local p = parse(x)
  return { left = opentag(p), right = closetag(p) }
end

-- mini.surroundの設定
require("mini.surround").setup {
  n_lines = 100,
  custom_surroundings = {
    t = {
      input = { "<(%w-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- from https://github.com/echasnovski/mini.surround/blob/14f418209ecf52d1a8de9d091eb6bd63c31a4e01/lua/mini/surround.lua#LL1048C13-L1048C72
      output = function()
        local emmet = require("mini.surround").user_input "Emmet"
        if not emmet then return nil end
        return totag(emmet)
      end,
    },
  },
}
