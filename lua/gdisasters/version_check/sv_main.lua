-- Checks the workshop page for version number.
local function RunCheck()
    http.Fetch(gDisasters_Revived.WorkShopURL, function(code)
        local lV = tonumber(string.match(code, "Version:(.-)<"))
        if not lV then return end -- Unable to locate last version
        if gDisasters_Revived.Version >= lV then return end
        gDisasters_Revived.Msg("Version " .. lV .. " is out!")
        cookie.Set("gdr_nextv", lV)
    end)
    http.Fetch(gDisasters_Revived.WorkShopURLAlternative, function(code)
        local lV = tonumber(string.match(code, "Version:(.-)<"))
        if not lV then return end -- Unable to locate last version
        if gDisasters_Revived.Version >= lV then return end
        gDisasters_Revived.Msg("Version " .. lV .. " is out!")
        cookie.Set("gdr_nextv", lV)
    end)
end

-- Se ejecuta directamente RunCheck en lugar de consultar cookies de tiempo
hook.Add("PlayerInitialSpawn", "gDisasters_checkversion", RunCheck)