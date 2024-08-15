-- ONLY PC
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("sgysh3nkaHUB x MM2", "BloodTheme")
local Tab = Window:NewTab("Player")
local Section = Tab:NewSection("SuperMan")
Section:NewToggle("SpeedHack", "You can be fast!", function(state)
    if state then
        game.Players.localPlayer.Character.Humanoid.WalkSpeed = 40
    else
        game.Players.localPlayer.Character.Humanoid.WalkSpeed = 25
    end
end)
Section:NewToggle("JumpHack", "Same with SpeedHack but jump power", function(state)
    if state then
        game.Players.localPlayer.Character.Humanoid.JumpPower = 100
    else
        game.Players.localPlayer.Character.Humanoid.JumpPower = 50
    end
end)
local Tab = Window:NewTab("Local")
local Section = Tab:NewSection("i caca")
Section:NewButton("Esp", "You can view players thru walls!", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sgysh3nka/scripts/main/MM2/mm2espscript.lua"))()
end)
local Tab = Window:NewTab("Other")
local Section = Tab:NewSection("Something what you need")
Section:NewButton("TP Tool", "Teleports you!", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sgysh3nka/scripts/main/UNIVERSAL/tptool.lua"))()
end)
Section:NewButton("Fly", "You can fly (yay)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sgysh3nka/scripts/main/UNIVERSAL/flyscript.lua"))()
end)
local Tab = Tab:NewSection("Contact")
local Section = Tab:NewSection("Contact me")
Section:NewLabel("My Discord: sgysh3nka")
end
