-- Checks the workshop page for version number.
local function RunCheck()
    http.Fetch(gDisasters_Revived.WorkShopURL, function(code)
        local lV = tonumber(string.match(code, "Version:(.-)<"))
        if not lV then return end -- Unable to locate last version
        if gDisasters_Revived.Version >= lV then return end
        gDisasters_Revived:Msg("Version " .. lV .. " is out!")
        cookie.Set("gdr_nextv", lV)
    end)
end
local function RunLogic()
    -- Check if a newer version is out
    local lV = cookie.GetNumber("gdr_nextv", gDisasters_Revived.Version)
    if cookie.GetNumber("gdr_nextvcheck", 0) > os.time() then
        if lV > gDisasters_Revived.Version then
            gDisasters_Revived:Msg("Version " .. lV .. " is out!")
        end
    else
        RunCheck()
        cookie.Set("gdr_nextvcheck", os.time() + 129600) -- Check in 1½ day
    end
end
hook.Add("PlayerInitialSpawn", "gDisasters_checkversion", RunLogic)