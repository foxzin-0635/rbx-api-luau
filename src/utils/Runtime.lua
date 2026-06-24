local Security = githubRequire("src/utils/Security.lua")
local Runtime = {}

function Runtime:IsStandardScript()
  return Security.Standard:IsInRange(getfenv().get_thread_identity())
end

function Runtime:IsRobloxPlaceScript()
  return getfenv().get_thread_identity() == Security.RobloxPlace
end

function Runtime:IsCommandBarScript()
  return getfenv().get_thread_identity() == Security.CommandBar
end

function Runtime:IsStandardPluginScript()
  return getfenv().get_thread_identity() == Security.PluginSecurity
end

function Runtime:IsLocalUserScript()
  return getfenv().get_thread_identity() == Security.LocalUserSecurity
end

function Runtime:IsCoreScript()
  return getfenv().get_thread_identity() >= Security.RobloxScriptSecurity
end

function Runtime:IsRobloxScript()
  if not rbx_api_config.SimulatedIdentityHacks.RobloxSecurity.CanUse then warn("Hack for RobloxSecurity was not set! Please configure the module.") return false end
  return getfenv().get_thread_identity() == rbx_api_config.SimulatedIdentityHacks.RobloxSecurity.IdentityLevel
end

function Runtime:IsEngineScript()
  if not rbx_api_config.SimulatedIdentityHacks.NotAccessibleSecurity.CanUse then warn("Hack for NotAccessibleSecurity was not set! Please configure the module.") return false end
  return getfenv().get_thread_identity() == rbx_api_config.SimulatedIdentityHacks.NotAccessibleSecurity.IdentityLevel
end

function Runtime:gettype()
  return "UtilityModule"
end

setmetatable(Runtime, {
  __metatable = "The metatable is locked",
  __index = Runtime,
  __newindex = function()
    return nil -- read-only
  end,
  __tostring = "Runtime",
})

return Runtime