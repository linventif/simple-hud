local hud = {}

function hud:RespX(x) return x/1920*ScrW() end
function hud:RespY(y) return y/1080*ScrH() end
function hud:Resp(x, y) return hud:RespX(x), hud:RespY(y) end

hook.Add("HUDPaint", "HudLogique", function()
    local ply = LocalPlayer()
    if ply:Alive() && IsValid(ply) then
        local name = ply:Nick()
        local money = ply:getDarkRPVar("money")
        if ply:getDarkRPVar("Energy") then
            local food = ply:getDarkRPVar("Energy")
        end
        local chakra = ply:GetNWInt("BCMana", 1000) / ply:GetNWInt("BCMaxMana", 1000)
        local health = ply:Health() / ply:GetMaxHealth()
        if health > 1 then
            health = 1
        end


        surface.SetDrawColor(48, 48, 48, 255)
		surface.DrawRect(hud:RespX(40), hud:RespY(1080-150), hud:RespX(272), hud:RespY(110))

        surface.SetDrawColor(81, 81, 81, 255)
		surface.DrawRect(hud:RespX(46), hud:RespY(1080-144), hud:RespX(260), hud:RespY(20))

        surface.SetDrawColor(137, 47, 42, 255)
		surface.DrawRect(hud:RespX(46), hud:RespY(1080-118), hud:RespX(260), hud:RespY(20))

        surface.SetDrawColor(106, 48, 141, 255)
		surface.DrawRect(hud:RespX(46), hud:RespY(1080-92), hud:RespX(260), hud:RespY(20))

        surface.SetDrawColor(41, 76, 144, 255)
		surface.DrawRect(hud:RespX(46), hud:RespY(1080-66), hud:RespX(260), hud:RespY(20))


        surface.SetDrawColor(202, 56, 56, 255 )
		surface.DrawRect(hud:RespX(46), hud:RespY(1080-118), hud:RespX(260*health), hud:RespY(20))

        surface.SetDrawColor(146, 56, 202, 255 )
		surface.DrawRect(hud:RespX(46), hud:RespY(1080-92), hud:RespX(260*health), hud:RespY(20))

        surface.SetDrawColor(56, 105, 202, 255 )
		surface.DrawRect(hud:RespX(46), hud:RespY(1080-66), hud:RespX(260*chakra), hud:RespY(20))
    end
end)

hook.Add("HUDShouldDraw", "DefautHUD", function(name )
    if (name == "CHudAmmo" or name == "CHudHealth" or name == "CHudBattery" or name == "DarkRP_HUD" or name == "DarkRP_Hungermod" ) then
        return false
    end
end )