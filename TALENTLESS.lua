-- TALENTLESS bootstrap (keyless/open-source)
-- Set this before running if needed:
-- getgenv().TALENTLESS_BASE_URL = "https://raw.githubusercontent.com/<user>/<repo>/main/"

local defaultBase = "https://raw.githubusercontent.com/cleme/TALENTLESS/main/"
local baseUrl = getgenv().TALENTLESS_BASE_URL or defaultBase

if baseUrl:sub(-1) ~= "/" then
    baseUrl = baseUrl .. "/"
end

getgenv().TALENTLESS_BASE_URL = baseUrl

local ok, err = pcall(function()
    local source = game:HttpGet(baseUrl .. "MAIN.lua", true)
    local chunk, loadErr = loadstring(source)
    if not chunk then
        error("Failed to compile MAIN.lua: " .. tostring(loadErr))
    end
    chunk()
end)

if not ok then
    warn("[TALENTLESS] Bootstrap failed.")
    warn("[TALENTLESS] Base URL: " .. tostring(baseUrl))
    warn("[TALENTLESS] Error: " .. tostring(err))
end
