local Common = {}

type AssertHandler = {
  expr: string,
  file: string,
  func: string
}

local Luau = {}
local FValue = (function()
  local module = {}
  local metatable = {
    __metatable = "The metatable is locked",
    __index = module,
    __tostring = function(t)
      return "FValue"
    end
  }
  
  local function createInstanceMetatable()
    local mtc = table.clone(metatable)
    mtc.__newindex = function() return nil end
    return mtc
  end
  FValue.list = {}
  
  function module.new<T>(name: string, def: T, dynamic: boolean)
    local self = setmetatable({}, nil)
    
    self.value = def
    self.dynamic = dynamic
    self.name = name
    self.list = self
    self.next = list
    
    setmetatable(self, createInstanceMetatable())
    return self
  end
  
  
  return module
end)()

return Common