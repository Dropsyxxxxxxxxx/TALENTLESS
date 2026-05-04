-- TALENTLESS bootstrap (keyless/open-source)
-- Set this before running if needed:
-- getgenv().TALENTLESS_BASE_URL = "https://raw.githubusercontent.com/<user>/<repo>/main/"

local defaultBase = "https://raw.githubusercontent.com/cleme/TALENTLESS/main/"
local baseUrl = getgenv().TALENTLESS_BASE_URL or defaultBase

if baseUrl:sub(-1) ~= "/" then
    baseUrl = baseUrl .. "/"
end

getgenv().TALENTLESS_BASE_URL = baseUrl

pcall(function()
    loadstring(game:HttpGet(baseUrl .. "MAIN.lua", true))()
end)
