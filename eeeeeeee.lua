local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/brazilianu/rE/main/ui.lua")()
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local runservice = game:GetService("RunService")
local cmdp = game:GetService("Players")
local cmdlp = cmdp.LocalPlayer
local cmduis = game:GetService("UserInputService")
crashy = true -- PUNE DA DAACA DA CRASH!!
on = false
local echeck =
   is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
   secure_load and "Sentinel" or
   KRNL_LOADED and "Krnl" or
   SONA_LOADED and "Sona" or
   "other"

-- UI

local window = lib:Window("Kebab - Entrenched [" .. echeck .. "]\n")
local homeTab = window:Tab("Tab 1")

--HOME TAB

homeTab:Toggle("Noclip Toggle",false, function(t)
    if t == false then
        if Noclipping then
            Noclipping:Disconnect()
        end
        Clip = true
    else
        noclip()
    end
end)

infiniteJump = false

homeTab:Toggle("Infinite Jump",false, function(t)
    if t == false then
        infiniteJump = false
    else
        infiniteJump = true
        cmduis.JumpRequest:Connect(function()
            if infiniteJump == true then
                cmdlp.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    end
end)

homeTab:Button("Exit Cheat", function()
    game:GetService("CoreGui").PauseNotification:Destroy()
end)

--SCRIPTS
if Noclipping then
	Noclipping:Disconnect()
end
Clip = true
function noclip()
	Clip = false
	function NoclipLoop()
		if Clip == false and cmdlp.Character ~= nil then
			for _, child in pairs(cmdlp.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
		end
	end
	Noclipping = game:GetService('RunService').Stepped:connect(NoclipLoop)
end
